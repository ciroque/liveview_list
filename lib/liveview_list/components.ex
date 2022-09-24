defmodule LiveviewList.Components do
  @moduledoc """
  Defines the List component. The List component is a container for various items including Lists and ListItems.
  """

  use Phoenix.LiveComponent

  @doc "To make the compiler happy."
  def render(assigns), do: ~H""

  @doc """
  Renders a List.

  Examples:
        iex> %Phoenix.LiveView.Rendered{} = LiveviewList.Components.list(%{})
  """
  @doc type: :component

  attr :classes, :string, required: false, default: "lvl-list"

  slot :title, required: false

  slot :list_item, required: false

  @spec list(map()) :: Phoenix.LiveView.Rendered.t()
  def list(assigns) do
    ~H"""
    <div class={@classes}>
      <div><%= render_slot(@title) %></div>
      <div><%= render_slot(@list_item) %></div>
    </div>
    """
  end

  @doc """
  Renders a List Item
  """
  @doc type: :component

  attr :classes, :string, required: false, default: "lvl-list_item"

  @spec list_item(map()) :: Phoenix.LiveView.Rendered.t()
  def list_item(assigns) do
    ~H"""
    <div class={@classes}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
