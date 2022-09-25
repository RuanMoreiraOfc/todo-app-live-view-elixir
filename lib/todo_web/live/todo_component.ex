defmodule TodoWeb.TodoComponent do
  use Phoenix.Component

  def todo(assigns) do
    id_text = "text-" <> assigns.id

    ~H"""
      <li id={@id} class="todo">
        <input
          type="checkbox"
          class="todo-checkbox"
          aria-label="Mark as completed"
          aria-describedby={id_text}
        />
        <span class="todo-icon bubble" />
        <span class="todo-text" id={id_text} ><%= @title %></span>

        <button class="todo-close reset-all" aria-label="Delete todo" />
        <span class="focus-within" />
      </li>
    """
  end
end
