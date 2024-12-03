defmodule DeceptionRouter.MixProject do
  use Mix.Project

  def project do
    [
      app: :deception_router,
      version: "1.0.1",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package(),
      description: description()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.0"},
      {:ex_doc, "~> 0.35.1", only: :dev, runtime: false}
    ]
  end

  defp description() do
    "Plug router that traps scanners, crawlers, and spambots in a forever loop"
  end

  defp docs() do
    [
      main: "readme",
      extras: ["README.md", "CHANGELOG.md"]
    ]
  end

  defp package() do
    [
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/mattludwigs/deception-router"}
    ]
  end
end
