defmodule ExampleWeb.Router do
  use ExampleWeb, :router

  scope "/" do
    match(:get, "/*sinkhole", DeceptionRouter, [])
  end
end
