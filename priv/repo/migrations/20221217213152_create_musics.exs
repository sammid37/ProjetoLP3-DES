defmodule Des.Repo.Migrations.CreateMusics do
  use Ecto.Migration

  def change do
    create table(:musics) do
      add :title, :string
      add :album, :string
      add :release, :integer
      add :genre, :string
      add :artist_id, references(:artists, on_delete: :nothing)

      timestamps()
    end

    create index(:musics, [:artist_id])
  end
end
