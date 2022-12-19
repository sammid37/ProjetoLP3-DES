defmodule Des.Discography.Music do
  use Ecto.Schema
  import Ecto.Changeset

  alias Des.Discography

  schema "musics" do
    field :title, :string
    field :release, :integer
    field :album, :string
    field :genre, :string
    field :artist_id, :id

    timestamps()
  end

  @doc false
  def changeset(music, attrs) do
    music
    |> cast(attrs, [:title, :album, :release, :genre, :artist_id])
    |> validate_required([:title, :album, :release, :genre, :artist_id])
  end

  def get_artist_name(music) do
    Discography.get_artist!(music.artist_id).name
  end
end
