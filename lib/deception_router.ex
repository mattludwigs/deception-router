defmodule DeceptionRouter do
  @moduledoc """
  DeceptionRouter forward your bots here forever
  """

  @char_space String.split(
                "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_-/",
                ""
              )
  @max_links 10
  @max_link_length 20

  use Plug.Router
  import Plug.Conn

  def init(_options) do
    []
  end

  def call(conn, opts) do
    links = generate_links()

    conn =
      conn
      |> assign(:links, links)

    super(conn, opts)
  end

  plug(:match)
  plug(:dispatch)

  match "/*sinkhole" do
    links = conn.assigns.links
    html = html_page(links)

    conn
    |> put_resp_content_type("text/html")
    |> send_resp(200, html)
  end

  defp generate_links() do
    num_links = Enum.random(5..@max_links)

    for _ <- 0..(num_links - 1) do
      generate_link()
    end
  end

  defp generate_link() do
    len_of_link = Enum.random(3..@max_link_length)

    Enum.reduce(0..len_of_link, "", fn _, link ->
      i = Enum.random(0..64)
      char = Enum.at(@char_space, i)
      link <> char
    end)
  end

  defp html_page(links) do
    # todo move this to a proper heex template to avoid injection?
    """
    <html>
    <body>
    #{Enum.reduce(links, "", &render_link/2)}
    </body>
    </html>
    """
  end

  defp render_link(link, other_links) do
    other_links <>
      """
      <div>
      <a href="/#{link}">#{link}</a>
      </div>
      """
  end
end
