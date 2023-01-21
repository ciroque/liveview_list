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
      assert rendered =
               rendered_to_string(~H"""
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

    test "renders multiple list items including lists", %{assigns: assigns} do
      assert rendered =
               rendered_to_string(~H"""
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
                 <:list_item classes="divvy">
                   <LiveviewList.Components.list>
                     <:list_item>
                      <div>First Sublist Item</div>
                     </:list_item>
                     <:list_item>
                      <div>Second Sublist Item</div>
                     </:list_item>
                     <:list_item>
                      <div>Third Sublist Item</div>
                     </:list_item>
                   </LiveviewList.Components.list>
                 </:list_item>
               </LiveviewList.Components.list>
               """)

      assert rendered =~ "First Item"
      assert rendered =~ "Second Item"
      assert rendered =~ "Third Item"

      assert rendered =~ "First Sublist Item"
      assert rendered =~ "Second Sublist Item"
      assert rendered =~ "Third Sublist Item"
      assert rendered =~ "div"
    end

    test "renders default class", %{assigns: assigns} do
      assert rendered =
               rendered_to_string(~H"""
               <LiveviewList.Components.list>
                 <:title>My Title</:title>
               </LiveviewList.Components.list>
               """)

      assert rendered =~ "lvl-list"
    end

    test "renders specified classes", %{assigns: assigns} do
      assert rendered =
               rendered_to_string(~H"""
               <LiveviewList.Components.list classes="bordered marginalized">
                 <:title><div class="title">My Title</div></:title>
               </LiveviewList.Components.list>
               """)

      assert rendered =~ "bordered"
      assert rendered =~ "marginalized"
    end
  end

  describe "list_item/1" do
    setup [:assigns]

    test "renders inner block", %{assigns: assigns} do
      assert rendered =
               rendered_to_string(~H"""
                 <LiveviewList.Components.list_item>
                   <div>Some inner <span>content</span></div>
                 </LiveviewList.Components.list_item>
               """)

      assert rendered =~ "<div>Some inner <span>content</span></div>"
    end

    test "renders default class", %{assigns: assigns} do
      assert rendered =
               rendered_to_string(~H"""
               <LiveviewList.Components.list_item>
               </LiveviewList.Components.list_item>
               """)

      assert rendered =~ "lvl-list_item"
    end

    test "renders specified classes", %{assigns: assigns} do
      assert rendered =
               rendered_to_string(~H"""
               <LiveviewList.Components.list_item classes="bordered marginalized">
               </LiveviewList.Components.list_item>
               """)

      assert rendered =~ "bordered"
      assert rendered =~ "marginalized"
    end
  end
end
