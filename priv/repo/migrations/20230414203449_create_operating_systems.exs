defmodule GameDatabase.Repo.Migrations.CreateOperatingSystems do
  use Ecto.Migration

  def change do
    create table(:operating_systems) do
      add :name, :string
      add :maker, :string

      timestamps()
    end
  end
end
