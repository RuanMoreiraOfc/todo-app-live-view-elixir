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

  test "user can't add a todo with repeated title", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")

    view
    |> create_todo("Todo with same title")
    |> create_todo("Todo with same title")

    assert has_element?(view, "[data-test=alert]", "This todo already exists!")
  end

  test "user can mark a todo as completed", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")

    view
    |> create_todo("Title")
    |> element("[data-test=todo-toggle]:not(:checked)")
    |> render_click()

    assert has_element?(view, "[data-test=todo-toggle]:checked")
  end

  test "user can delete a todo", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")

    view
    |> create_todo("a")
    |> create_todo("b")
    |> element("[data-test=todo]:nth-child(1) [data-test=todo-delete]")
    |> render_click()

    assert has_element?(view, "[data-test=todo]", "a") === false
    assert has_element?(view, "[data-test=todo]", "b")
  end

  test "user can clear all completed todos", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")

    view
    |> create_todo("a")
    |> create_todo("b")
    |> create_todo("c")
    |> create_todo("d")
    |> mark_todo_as_completed(1)
    |> mark_todo_as_completed(3)
    |> element("[data-test=clear-completed]")
    |> render_click()

    assert has_element?(view, "[data-test=todo]", "a") === false
    assert has_element?(view, "[data-test=todo]", "b")
    assert has_element?(view, "[data-test=todo]", "c") === false
    assert has_element?(view, "[data-test=todo]", "d")
  end

  test "user can filter by `active` todos", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")

    view
    |> create_todo("a")
    |> create_todo("b")
    |> create_todo("c")
    |> create_todo("d")
    |> mark_todo_as_completed(1)
    |> mark_todo_as_completed(2)
    |> mark_todo_as_completed(3)
    |> filter_todos(:active)

    assert has_element?(view, "[data-test=todo]", "a") === false
    assert has_element?(view, "[data-test=todo]", "b") === false
    assert has_element?(view, "[data-test=todo]", "c") === false
    assert has_element?(view, "[data-test=todo]", "d")
  end

  # HELPERS

  defp create_todo(view, title) do
    view
    |> form("[data-test=form]", title: title)
    |> render_submit()

    view
  end

  defp mark_todo_as_completed(view, index) do
    view
    |> element("[data-test=todo]:nth-child(#{index}) [data-test=todo-toggle]")
    |> render_click()

    view
  end

  defp filter_todos(view, filter) do
    view
    |> element("[data-test=filter-btn]", "#{filter}")
    |> render_click()

    view
  end
end
