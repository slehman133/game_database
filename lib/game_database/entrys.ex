defmodule GameDatabase.Entrys do
  @moduledoc """
  The Entrys context.
  """

  import Ecto.Query, warn: false
  alias GameDatabase.Repo

  alias GameDatabase.Entrys.Brand

  @doc """
  Returns the list of brands.

  ## Examples

      iex> list_brands()
      [%Brand{}, ...]

  """
  def list_brands do
    Repo.all(Brand)
  end

  @doc """
  Gets a single brand.

  Raises `Ecto.NoResultsError` if the Brand does not exist.

  ## Examples

      iex> get_brand!(123)
      %Brand{}

      iex> get_brand!(456)
      ** (Ecto.NoResultsError)

  """
  def get_brand!(id), do: Repo.get!(Brand, id)

  @doc """
  Creates a brand.

  ## Examples

      iex> create_brand(%{field: value})
      {:ok, %Brand{}}

      iex> create_brand(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_brand(attrs \\ %{}) do
    %Brand{}
    |> Brand.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a brand.

  ## Examples

      iex> update_brand(brand, %{field: new_value})
      {:ok, %Brand{}}

      iex> update_brand(brand, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_brand(%Brand{} = brand, attrs) do
    brand
    |> Brand.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a brand.

  ## Examples

      iex> delete_brand(brand)
      {:ok, %Brand{}}

      iex> delete_brand(brand)
      {:error, %Ecto.Changeset{}}

  """
  def delete_brand(%Brand{} = brand) do
    Repo.delete(brand)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking brand changes.

  ## Examples

      iex> change_brand(brand)
      %Ecto.Changeset{data: %Brand{}}

  """
  def change_brand(%Brand{} = brand, attrs \\ %{}) do
    Brand.changeset(brand, attrs)
  end

  alias GameDatabase.Entrys.OperatingSystem

  @doc """
  Returns the list of operating_systems.

  ## Examples

      iex> list_operating_systems()
      [%OperatingSystem{}, ...]

  """
  def list_operating_systems do
    Repo.all(OperatingSystem)
  end

  @doc """
  Gets a single operating_system.

  Raises `Ecto.NoResultsError` if the Operating system does not exist.

  ## Examples

      iex> get_operating_system!(123)
      %OperatingSystem{}

      iex> get_operating_system!(456)
      ** (Ecto.NoResultsError)

  """
  def get_operating_system!(id), do: Repo.get!(OperatingSystem, id)

  @doc """
  Creates a operating_system.

  ## Examples

      iex> create_operating_system(%{field: value})
      {:ok, %OperatingSystem{}}

      iex> create_operating_system(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_operating_system(attrs \\ %{}) do
    %OperatingSystem{}
    |> OperatingSystem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a operating_system.

  ## Examples

      iex> update_operating_system(operating_system, %{field: new_value})
      {:ok, %OperatingSystem{}}

      iex> update_operating_system(operating_system, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_operating_system(%OperatingSystem{} = operating_system, attrs) do
    operating_system
    |> OperatingSystem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a operating_system.

  ## Examples

      iex> delete_operating_system(operating_system)
      {:ok, %OperatingSystem{}}

      iex> delete_operating_system(operating_system)
      {:error, %Ecto.Changeset{}}

  """
  def delete_operating_system(%OperatingSystem{} = operating_system) do
    Repo.delete(operating_system)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking operating_system changes.

  ## Examples

      iex> change_operating_system(operating_system)
      %Ecto.Changeset{data: %OperatingSystem{}}

  """
  def change_operating_system(%OperatingSystem{} = operating_system, attrs \\ %{}) do
    OperatingSystem.changeset(operating_system, attrs)
  end

  alias GameDatabase.Entrys.Game

  @doc """
  Returns the list of games.

  ## Examples

      iex> list_games()
      [%Game{}, ...]

  """
  def list_games do
    Repo.all(Game)
  end

  @doc """
  Gets a single game.

  Raises `Ecto.NoResultsError` if the Game does not exist.

  ## Examples

      iex> get_game!(123)
      %Game{}

      iex> get_game!(456)
      ** (Ecto.NoResultsError)

  """
  def get_game!(id), do: Repo.get!(Game, id)

  @doc """
  Creates a game.

  ## Examples

      iex> create_game(%{field: value})
      {:ok, %Game{}}

      iex> create_game(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_game(attrs \\ %{}) do
    %Game{}
    |> Game.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a game.

  ## Examples

      iex> update_game(game, %{field: new_value})
      {:ok, %Game{}}

      iex> update_game(game, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_game(%Game{} = game, attrs) do
    game
    |> Game.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a game.

  ## Examples

      iex> delete_game(game)
      {:ok, %Game{}}

      iex> delete_game(game)
      {:error, %Ecto.Changeset{}}

  """
  def delete_game(%Game{} = game) do
    Repo.delete(game)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking game changes.

  ## Examples

      iex> change_game(game)
      %Ecto.Changeset{data: %Game{}}

  """
  def change_game(%Game{} = game, attrs \\ %{}) do
    Game.changeset(game, attrs)
  end
end
