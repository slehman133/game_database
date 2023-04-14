defmodule GameDatabase.Entrys.Game do
  use Ecto.Schema
  import Ecto.Changeset

  alias GameDatabase.Entrys.OperatingSystem
  alias GameDatabase.Entrys.Brand
  schema "games" do
    field :description, :string
    field :name, :string
    belongs_to :operating_system, OperatingSystem
    belongs_to :brand, Brand

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:name, :description, :operating_system_id])
    |> validate_required([:name, :description, :operating_system_id])
  end
end
