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
       uncompleted_count: 0
     )}
  end

  def handle_event("toggle-darkmode", _params, socket) do
    {:noreply, assign(socket, darkmode?: !socket.assigns.darkmode?)}
  end

  def handle_event("create-todo", %{"title" => title}, socket) do
    %{
      todos: old_todos,
      uncompleted_count: old_uncompleted_count
    } = socket.assigns

    nil = Enum.find(old_todos, :find, fn todo -> todo.title === title end)

    {:noreply,
     assign(socket,
       todos: old_todos ++ [Todo.build(title)],
       uncompleted_count: old_uncompleted_count + 1
     )}
  rescue
    _e ->
      {:noreply, put_flash(socket, :error, "This todo already exists!")}
  end

  def handle_event("toggle-todo", %{"id" => id}, socket) do
    transformed_todos =
      Enum.map(socket.assigns.todos, fn todo ->
        case todo.id do
          ^id -> %Todo{todo | completed?: !todo.completed?}
          _ -> todo
        end
      end)

    {:noreply,
     assign(socket,
       todos: transformed_todos,
       uncompleted_count: Enum.count(transformed_todos, fn todo -> !todo.completed? end)
     )}
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
    filtered_todos = Enum.map(socket.assigns.todos, fn todo -> !todo.completed? end)

    {:noreply,
     assign(socket,
       todos: filtered_todos,
       uncompleted_count: Enum.count(filtered_todos, fn todo -> !todo.completed? end)
     )}
  end
end
