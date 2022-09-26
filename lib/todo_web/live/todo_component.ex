defmodule TodoWeb.TodoComponent do
  use Phoenix.Component

  def todo(assigns) do
    id_text = "text-" <> assigns.id

    ~H"""
      <li id={@id} class="todo" data-test="todo">
        <input
          type="checkbox"
          class="todo-checkbox"
          checked={@completed?}
          aria-label="Mark as completed"
          aria-describedby={id_text}
          phx-click="toggle-todo"
          phx-value-id={@id}
        />
        <span class="todo-icon bubble" />
        <span class="todo-text" id={id_text} ><%= @title %></span>

        <button
          class="todo-close reset-all"
          aria-label="Delete todo"
          phx-click="delete-todo"
          phx-value-id={@id}
        />
        <span class="focus-within" />
      </li>
    """
  end
end
