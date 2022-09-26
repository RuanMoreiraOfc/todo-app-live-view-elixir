defmodule TodoWeb.FilterComponent do
  use Phoenix.Component

  def filter(assigns) do
    assigns = Map.put_new(assigns, :aria_pressed, "false")

    ~H"""
      <li class="filter">
        <button class="filter-button reset-all" aria-pressed={"#{@aria_pressed}"}>
          <%= @children %>
        </button>
      </li>
    """
  end
end
