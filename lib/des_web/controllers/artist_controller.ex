defmodule DesWeb.ArtistController do
  use DesWeb, :controller

  alias Des.Discography
  alias Des.Discography.Artist

  def index(conn, _params) do
    artists = Discography.list_artists()
    render(conn, "index.html", artists: artists)
  end

  def new(conn, _params) do
    changeset = Discography.change_artist(%Artist{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"artist" => artist_params}) do
    case Discography.create_artist(artist_params) do
      {:ok, artist} ->
        conn
        |> put_flash(:info, "Artist created successfully.")
        |> redirect(to: Routes.artist_path(conn, :show, artist))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    artist = Discography.get_artist!(id)
    render(conn, "show.html", artist: artist)
  end

  def edit(conn, %{"id" => id}) do
    artist = Discography.get_artist!(id)
    changeset = Discography.change_artist(artist)
    render(conn, "edit.html", artist: artist, changeset: changeset)
  end

  def update(conn, %{"id" => id, "artist" => artist_params}) do
    artist = Discography.get_artist!(id)

    case Discography.update_artist(artist, artist_params) do
      {:ok, artist} ->
        conn
        |> put_flash(:info, "Artist updated successfully.")
        |> redirect(to: Routes.artist_path(conn, :show, artist))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", artist: artist, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    artist = Discography.get_artist!(id)
    {:ok, _artist} = Discography.delete_artist(artist)

    conn
    |> put_flash(:info, "Artist deleted successfully.")
    |> redirect(to: Routes.artist_path(conn, :index))
  end
end
