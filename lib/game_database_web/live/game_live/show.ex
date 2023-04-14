defmodule GameDatabaseWeb.GameLive.Show do
  use GameDatabaseWeb, :live_view

  alias GameDatabase.Entrys

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:game, Entrys.get_game!(id))
     |> assign(:operating_systems, Entrys.list_operating_systems())
     |> assign(:brands, Entrys.list_brands())}
  end

  defp page_title(:show), do: "Show Game"
  defp page_title(:edit), do: "Edit Game"
end
