defmodule LiveviewList.ComponentsTest do
  use ExUnit.Case

  @moduletag :capture_log

  doctest LiveviewList.Components

  test "module exists" do
    assert is_list(List.module_info())
  end
end
