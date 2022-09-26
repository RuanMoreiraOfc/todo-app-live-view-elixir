defmodule TodoWeb.TodoLive do
  use Phoenix.LiveView

  import TodoWeb.TodoComponent
  import TodoWeb.FilterComponent

  def mount(_params, _session, socket) do
    {:ok, assign(socket, darkmode?: nil)}
  end

  def handle_event("toggle-darkmode", _params, socket) do
    {:noreply, assign(socket, darkmode?: !socket.assigns.darkmode?)}
  end
end
