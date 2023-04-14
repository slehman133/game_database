defmodule GameDatabaseWeb.GameLive.Index do
  use GameDatabaseWeb, :live_view

  alias GameDatabase.Entrys
  alias GameDatabase.Entrys.Game
  alias GameDatabase.Entrys.OperatingSystem
  alias GameDatabase.Entrys.Brand

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      Entrys.subscribe()
    end
    {:ok, stream(socket, :games, Entrys.list_games())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Game")
    |> assign(:game, Entrys.get_game!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Game")
    |> assign(:game, %Game{})
    |> assign(:operating_systems, Entrys.list_operating_systems())
    |> assign(:brands, Entrys.list_brands())
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Games")
    |> assign(:game, nil)
  end

  @impl true
  def handle_info({GameDatabaseWeb.GameLive.FormComponent, {:saved, game}}, socket) do
    {:noreply, stream_insert(socket, :games, game
    |>Repo.preload(:primary_os, force: true)
    |>Repo.preload(:brand, force: true))
  }
  end

  @impl true
  def handle_info({:game_created, game}, socket) do
    IO.puts "Adding a game that was saved from PubSub"
    {:noreply, stream_insert(socket, :games, game)}
  end

  @impl true
  def handle_info({:game_updated, game}, socket) do
    IO.puts "Game updated via PubSub"
    {:noreply, stream_insert(socket, :games, game)}
  end

  @impl true
  def handle_info({:game_deleted, game}, socket) do
    IO.puts "Game deletde via PubSub"
    {:noreply, stream_delete(socket, :games, game)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    game = Entrys.get_game!(id)
    {:ok, _} = Entrys.delete_game(game)

    {:noreply, stream_delete(socket, :games, game)}
  end
end
