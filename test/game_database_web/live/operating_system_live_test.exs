defmodule GameDatabaseWeb.OperatingSystemLiveTest do
  use GameDatabaseWeb.ConnCase

  import Phoenix.LiveViewTest
  import GameDatabase.EntrysFixtures

  @create_attrs %{maker: "some maker", name: "some name"}
  @update_attrs %{maker: "some updated maker", name: "some updated name"}
  @invalid_attrs %{maker: nil, name: nil}

  defp create_operating_system(_) do
    operating_system = operating_system_fixture()
    %{operating_system: operating_system}
  end

  describe "Index" do
    setup [:create_operating_system]

    test "lists all operating_systems", %{conn: conn, operating_system: operating_system} do
      {:ok, _index_live, html} = live(conn, ~p"/operating_systems")

      assert html =~ "Listing Operating systems"
      assert html =~ operating_system.maker
    end

    test "saves new operating_system", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/operating_systems")

      assert index_live |> element("a", "New Operating system") |> render_click() =~
               "New Operating system"

      assert_patch(index_live, ~p"/operating_systems/new")

      assert index_live
             |> form("#operating_system-form", operating_system: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#operating_system-form", operating_system: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/operating_systems")

      html = render(index_live)
      assert html =~ "Operating system created successfully"
      assert html =~ "some maker"
    end

    test "updates operating_system in listing", %{conn: conn, operating_system: operating_system} do
      {:ok, index_live, _html} = live(conn, ~p"/operating_systems")

      assert index_live |> element("#operating_systems-#{operating_system.id} a", "Edit") |> render_click() =~
               "Edit Operating system"

      assert_patch(index_live, ~p"/operating_systems/#{operating_system}/edit")

      assert index_live
             |> form("#operating_system-form", operating_system: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#operating_system-form", operating_system: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/operating_systems")

      html = render(index_live)
      assert html =~ "Operating system updated successfully"
      assert html =~ "some updated maker"
    end

    test "deletes operating_system in listing", %{conn: conn, operating_system: operating_system} do
      {:ok, index_live, _html} = live(conn, ~p"/operating_systems")

      assert index_live |> element("#operating_systems-#{operating_system.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#operating_systems-#{operating_system.id}")
    end
  end

  describe "Show" do
    setup [:create_operating_system]

    test "displays operating_system", %{conn: conn, operating_system: operating_system} do
      {:ok, _show_live, html} = live(conn, ~p"/operating_systems/#{operating_system}")

      assert html =~ "Show Operating system"
      assert html =~ operating_system.maker
    end

    test "updates operating_system within modal", %{conn: conn, operating_system: operating_system} do
      {:ok, show_live, _html} = live(conn, ~p"/operating_systems/#{operating_system}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Operating system"

      assert_patch(show_live, ~p"/operating_systems/#{operating_system}/show/edit")

      assert show_live
             |> form("#operating_system-form", operating_system: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#operating_system-form", operating_system: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/operating_systems/#{operating_system}")

      html = render(show_live)
      assert html =~ "Operating system updated successfully"
      assert html =~ "some updated maker"
    end
  end
end
