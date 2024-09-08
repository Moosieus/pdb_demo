defmodule PdbDemoTest do
  use ExUnit.Case
  doctest PdbDemo

  test "greets the world" do
    assert PdbDemo.hello() == :world
  end
end
