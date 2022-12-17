defmodule Des.Discography.Artist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "artists" do
    field :birth, :date
    field :country, :string
    field :name, :string
    field :picture, :string

    timestamps()
  end

  @doc false
  def changeset(artist, attrs) do
    artist
    |> cast(attrs, [:name, :birth, :country, :picture])
    |> validate_required([:name, :birth, :country, :picture])
  end
end
