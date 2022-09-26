defmodule TodoWeb.TodoLiveTest do
  use TodoWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  test "user can toggle from dark mode to light mode", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")

    view
    |> element("[data-test=toggle-darkmode]")
    |> render_click()

    assert has_element?(view, ".app[theme=dark]") === false
  end
end
