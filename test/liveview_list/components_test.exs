defmodule LiveviewList.ComponentsTest do
  use ExUnit.Case

  import Phoenix.LiveViewTest
  import Phoenix.Component

  doctest LiveviewList.Components

  def assigns(_), do: %{assigns: %{}}

  describe "list/1" do
    setup [:assigns]

    test "renders :title", %{assigns: assigns} do
      assert rendered_to_string(~H"""
             <LiveviewList.Components.list>
               <:title>My Title</:title>
             </LiveviewList.Components.list>
             """) =~ "My Title"
    end

    test "renders a single list item", %{assigns: assigns} do
      assert rendered_to_string(~H"""
             <LiveviewList.Components.list>
               <:title>My Title</:title>
               <:list_item>
                <div>First Item</div>
               </:list_item>
             </LiveviewList.Components.list>
             """) =~ "First Item"
    end

    test "renders multiple list items", %{assigns: assigns} do
      assert rendered = rendered_to_string(~H"""
             <LiveviewList.Components.list>
               <:title>My Title</:title>
               <:list_item>
                <div>First Item</div>
               </:list_item>
               <:list_item>
                <div>Second Item</div>
               </:list_item>
               <:list_item>
                <div>Third Item</div>
               </:list_item>
             </LiveviewList.Components.list>
             """)

      assert rendered =~ "First Item"
      assert rendered =~ "Second Item"
      assert rendered =~ "Third Item"
    end
  end
end
