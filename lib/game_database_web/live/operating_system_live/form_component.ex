defmodule GameDatabaseWeb.OperatingSystemLive.FormComponent do
  use GameDatabaseWeb, :live_component

  alias GameDatabase.Entrys

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage operating_system records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="operating_system-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:maker]} type="text" label="Maker" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Operating system</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{operating_system: operating_system} = assigns, socket) do
    changeset = Entrys.change_operating_system(operating_system)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"operating_system" => operating_system_params}, socket) do
    changeset =
      socket.assigns.operating_system
      |> Entrys.change_operating_system(operating_system_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"operating_system" => operating_system_params}, socket) do
    save_operating_system(socket, socket.assigns.action, operating_system_params)
  end

  defp save_operating_system(socket, :edit, operating_system_params) do
    case Entrys.update_operating_system(socket.assigns.operating_system, operating_system_params) do
      {:ok, operating_system} ->
        notify_parent({:saved, operating_system})

        {:noreply,
         socket
         |> put_flash(:info, "Operating system updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_operating_system(socket, :new, operating_system_params) do
    case Entrys.create_operating_system(operating_system_params) do
      {:ok, operating_system} ->
        notify_parent({:saved, operating_system})

        {:noreply,
         socket
         |> put_flash(:info, "Operating system created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
