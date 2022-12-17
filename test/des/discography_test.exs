defmodule Des.DiscographyTest do
  use Des.DataCase

  alias Des.Discography

  describe "artists" do
    alias Des.Discography.Artist

    import Des.DiscographyFixtures

    @invalid_attrs %{birth: nil, country: nil, name: nil, picture: nil}

    test "list_artists/0 returns all artists" do
      artist = artist_fixture()
      assert Discography.list_artists() == [artist]
    end

    test "get_artist!/1 returns the artist with given id" do
      artist = artist_fixture()
      assert Discography.get_artist!(artist.id) == artist
    end

    test "create_artist/1 with valid data creates a artist" do
      valid_attrs = %{birth: ~D[2022-12-16], country: "some country", name: "some name", picture: "some picture"}

      assert {:ok, %Artist{} = artist} = Discography.create_artist(valid_attrs)
      assert artist.birth == ~D[2022-12-16]
      assert artist.country == "some country"
      assert artist.name == "some name"
      assert artist.picture == "some picture"
    end

    test "create_artist/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Discography.create_artist(@invalid_attrs)
    end

    test "update_artist/2 with valid data updates the artist" do
      artist = artist_fixture()
      update_attrs = %{birth: ~D[2022-12-17], country: "some updated country", name: "some updated name", picture: "some updated picture"}

      assert {:ok, %Artist{} = artist} = Discography.update_artist(artist, update_attrs)
      assert artist.birth == ~D[2022-12-17]
      assert artist.country == "some updated country"
      assert artist.name == "some updated name"
      assert artist.picture == "some updated picture"
    end

    test "update_artist/2 with invalid data returns error changeset" do
      artist = artist_fixture()
      assert {:error, %Ecto.Changeset{}} = Discography.update_artist(artist, @invalid_attrs)
      assert artist == Discography.get_artist!(artist.id)
    end

    test "delete_artist/1 deletes the artist" do
      artist = artist_fixture()
      assert {:ok, %Artist{}} = Discography.delete_artist(artist)
      assert_raise Ecto.NoResultsError, fn -> Discography.get_artist!(artist.id) end
    end

    test "change_artist/1 returns a artist changeset" do
      artist = artist_fixture()
      assert %Ecto.Changeset{} = Discography.change_artist(artist)
    end
  end

  describe "musics" do
    alias Des.Discography.Music

    import Des.DiscographyFixtures

    @invalid_attrs %{album: nil, artist_id: nil, genre: nil, release: nil, title: nil}

    test "list_musics/0 returns all musics" do
      music = music_fixture()
      assert Discography.list_musics() == [music]
    end

    test "get_music!/1 returns the music with given id" do
      music = music_fixture()
      assert Discography.get_music!(music.id) == music
    end

    test "create_music/1 with valid data creates a music" do
      valid_attrs = %{album: "some album", artist_id: 42, genre: "some genre", release: 42, title: "some title"}

      assert {:ok, %Music{} = music} = Discography.create_music(valid_attrs)
      assert music.album == "some album"
      assert music.artist_id == 42
      assert music.genre == "some genre"
      assert music.release == 42
      assert music.title == "some title"
    end

    test "create_music/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Discography.create_music(@invalid_attrs)
    end

    test "update_music/2 with valid data updates the music" do
      music = music_fixture()
      update_attrs = %{album: "some updated album", artist_id: 43, genre: "some updated genre", release: 43, title: "some updated title"}

      assert {:ok, %Music{} = music} = Discography.update_music(music, update_attrs)
      assert music.album == "some updated album"
      assert music.artist_id == 43
      assert music.genre == "some updated genre"
      assert music.release == 43
      assert music.title == "some updated title"
    end

    test "update_music/2 with invalid data returns error changeset" do
      music = music_fixture()
      assert {:error, %Ecto.Changeset{}} = Discography.update_music(music, @invalid_attrs)
      assert music == Discography.get_music!(music.id)
    end

    test "delete_music/1 deletes the music" do
      music = music_fixture()
      assert {:ok, %Music{}} = Discography.delete_music(music)
      assert_raise Ecto.NoResultsError, fn -> Discography.get_music!(music.id) end
    end

    test "change_music/1 returns a music changeset" do
      music = music_fixture()
      assert %Ecto.Changeset{} = Discography.change_music(music)
    end
  end
end
