defmodule TodoWeb.TodoLive do
  use Phoenix.LiveView

  import TodoWeb.TodoComponent
  import TodoWeb.FilterComponent

  alias Todo.Todo

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       darkmode?: Map.get(params, :darkmode, nil),
       filters: [:all, :active, :completed],
       filter_selected: :all,
       todos: [],
       all_todos: [],
       uncompleted_count: 0
     )}
  end

  def handle_event("toggle-darkmode", _params, socket) do
    {:noreply, assign(socket, darkmode?: !socket.assigns.darkmode?)}
  end

  def handle_event("create-todo", %{"title" => title}, socket) do
    nil = handle_all_todos(socket, :find, fn todo -> todo.title === title end)

    socket
    |> handle_all_todos(:concat, [Todo.build(title)])
    |> send_complete_response(socket)
  rescue
    _e ->
      {:noreply, put_flash(socket, :error, "This todo already exists!")}
  end

  def handle_event("toggle-todo", %{"id" => id}, socket) do
    socket
    |> handle_all_todos(:map, fn todo ->
      case todo.id do
        ^id -> %Todo{todo | completed?: !todo.completed?}
        _id -> todo
      end
    end)
    |> send_complete_response(socket)
  end

  def handle_event("delete-todo", %{"id" => id}, socket) do
    socket
    |> handle_all_todos(:filter, fn todo -> todo.id !== id end)
    |> send_complete_response(socket)
  end

  def handle_event("delete-todo", %{"id" => id}, socket) do
    %{
      todos: old_todos,
      uncompleted_count: old_uncompleted_count
    } = socket.assigns

    todo = Enum.find(old_todos, fn todo -> todo.id === id end)

    {:noreply,
     assign(socket,
       todos: old_todos -- [todo],
       uncompleted_count: old_uncompleted_count - 1
     )}
  end

  def handle_event("clear-completed", _params, socket) do
    socket
    |> handle_all_todos(:filter, fn todo -> !todo.completed? end)
    |> send_complete_response(socket)
  end

  # HELPERS

  defp handle_all_todos(%{assigns: %{all_todos: all_todos}}, key, params) do
    apply(Enum, key, [all_todos, params])
  end

  defp get_uncompleted_count(todos) do
    Enum.count(todos, fn todo -> !todo.completed? end)
  end

  defp send_complete_response(all_todos, socket) do
    {:noreply,
     assign(socket,
       todos: all_todos,
       all_todos: all_todos,
       uncompleted_count: get_uncompleted_count(all_todos)
     )}
  end
end
