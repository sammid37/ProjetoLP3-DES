defmodule Des.Repo.Migrations.CreateMusics do
  use Ecto.Migration

  def change do
    create table(:musics) do
      add :title, :string
      add :album, :string
      add :release, :integer
      add :genre, :string
      add :artist_id, :integer

      timestamps()
    end
  end
end
