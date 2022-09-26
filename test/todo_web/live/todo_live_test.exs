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

  test "user can add a new todo", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")

    create_todo(view, "Here'd come a todo title")

    assert has_element?(view, "[data-test=todo]", "Here'd come a todo title")
  end

  # HELPERS

  defp create_todo(view, title) do
    view
    |> form("[data-test=form]", title: title)
    |> render_submit()

    view
  end
end
