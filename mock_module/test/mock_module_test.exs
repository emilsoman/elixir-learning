use ModuleHelpers

mockmodule Greeter do
  def say_random_greeting do
    "mock greeting"
  end
end

defmodule MockModuleTest do
  use ExUnit.Case

  test "greet" do
    assert MockModule.greet == "mock greeting"
  after
    purge(Greeter)
  end
end
