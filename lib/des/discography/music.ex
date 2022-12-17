defmodule Des.Discography.Music do
  use Ecto.Schema
  import Ecto.Changeset

  schema "musics" do
    field :album, :string
    field :artist_id, :integer
    field :genre, :string
    field :release, :integer
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(music, attrs) do
    music
    |> cast(attrs, [:title, :album, :release, :genre, :artist_id])
    |> validate_required([:title, :album, :release, :genre, :artist_id])
  end
end
