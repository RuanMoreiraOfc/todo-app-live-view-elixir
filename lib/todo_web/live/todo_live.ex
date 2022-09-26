defmodule TodoWeb.TodoLive do
  use Phoenix.LiveView

  import TodoWeb.TodoComponent
  import TodoWeb.FilterComponent

  def mount(_params, _session, socket) do
    {:ok, assign(socket, uncompleted_count: 0)}
  end
end
