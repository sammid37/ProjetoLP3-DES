defmodule Des.Repo.Migrations.CreateArtists do
  use Ecto.Migration

  def change do
    create table(:artists) do
      add :name, :string
      add :birth, :date
      add :country, :string
      add :picture, :string

      timestamps()
    end
  end
end
