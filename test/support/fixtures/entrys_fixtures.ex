defmodule GameDatabase.EntrysFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GameDatabase.Entrys` context.
  """

  @doc """
  Generate a brand.
  """
  def brand_fixture(attrs \\ %{}) do
    {:ok, brand} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> GameDatabase.Entrys.create_brand()

    brand
  end

  @doc """
  Generate a operating_system.
  """
  def operating_system_fixture(attrs \\ %{}) do
    {:ok, operating_system} =
      attrs
      |> Enum.into(%{
        maker: "some maker",
        name: "some name"
      })
      |> GameDatabase.Entrys.create_operating_system()

    operating_system
  end

  @doc """
  Generate a game.
  """
  def game_fixture(attrs \\ %{}) do
    {:ok, game} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> GameDatabase.Entrys.create_game()

    game
  end
end
