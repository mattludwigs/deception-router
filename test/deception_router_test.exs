defmodule DeceptionRouterTest do
  use ExUnit.Case
  doctest DeceptionRouter

  test "greets the world" do
    assert DeceptionRouter.hello() == :world
  end
end
