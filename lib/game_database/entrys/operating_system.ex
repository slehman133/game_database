defmodule GameDatabase.Entrys.OperatingSystem do
  use Ecto.Schema
  import Ecto.Changeset

  alias GameDatabase.Entrys.Game

  schema "operating_systems" do
    field :maker, :string
    field :name, :string
    has_many :games, Game
    timestamps()
  end

  @doc false
  def changeset(operating_system, attrs) do
    operating_system
    |> cast(attrs, [:name, :maker])
    |> validate_required([:name, :maker])
  end
end
