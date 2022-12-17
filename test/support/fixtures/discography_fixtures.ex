defmodule Des.DiscographyFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Des.Discography` context.
  """

  @doc """
  Generate a artist.
  """
  def artist_fixture(attrs \\ %{}) do
    {:ok, artist} =
      attrs
      |> Enum.into(%{
        birth: ~D[2022-12-16],
        country: "some country",
        name: "some name",
        picture: "some picture"
      })
      |> Des.Discography.create_artist()

    artist
  end

  @doc """
  Generate a music.
  """
  def music_fixture(attrs \\ %{}) do
    {:ok, music} =
      attrs
      |> Enum.into(%{
        album: "some album",
        artist_id: 42,
        genre: "some genre",
        release: 42,
        title: "some title"
      })
      |> Des.Discography.create_music()

    music
  end
end
