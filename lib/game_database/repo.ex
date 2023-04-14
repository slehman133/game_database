defmodule GameDatabase.Repo do
  use Ecto.Repo,
    otp_app: :game_database,
    adapter: Ecto.Adapters.Postgres
end
