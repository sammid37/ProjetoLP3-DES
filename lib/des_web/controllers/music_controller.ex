defmodule DesWeb.MusicController do
  use DesWeb, :controller

  alias Des.Discography
  alias Des.Discography.Music

  def index(conn, _params) do
    musics = Discography.list_musics()
    render(conn, "index.html", musics: musics)
  end

  def new(conn, _params) do
    changeset = Discography.change_music(%Music{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"music" => music_params}) do
    case Discography.create_music(music_params) do
      {:ok, music} ->
        conn
        |> put_flash(:info, "Music created successfully.")
        |> redirect(to: Routes.music_path(conn, :show, music))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    music = Discography.get_music!(id)
    render(conn, "show.html", music: music)
  end

  def edit(conn, %{"id" => id}) do
    music = Discography.get_music!(id)
    changeset = Discography.change_music(music)
    render(conn, "edit.html", music: music, changeset: changeset)
  end

  def update(conn, %{"id" => id, "music" => music_params}) do
    music = Discography.get_music!(id)

    case Discography.update_music(music, music_params) do
      {:ok, music} ->
        conn
        |> put_flash(:info, "Music updated successfully.")
        |> redirect(to: Routes.music_path(conn, :show, music))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", music: music, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    music = Discography.get_music!(id)
    {:ok, _music} = Discography.delete_music(music)

    conn
    |> put_flash(:info, "Music deleted successfully.")
    |> redirect(to: Routes.music_path(conn, :index))
  end
end
