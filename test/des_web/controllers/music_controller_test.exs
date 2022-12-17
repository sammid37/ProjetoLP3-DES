defmodule DesWeb.MusicControllerTest do
  use DesWeb.ConnCase

  import Des.DiscographyFixtures

  @create_attrs %{album: "some album", artist_id: 42, genre: "some genre", release: 42, title: "some title"}
  @update_attrs %{album: "some updated album", artist_id: 43, genre: "some updated genre", release: 43, title: "some updated title"}
  @invalid_attrs %{album: nil, artist_id: nil, genre: nil, release: nil, title: nil}

  describe "index" do
    test "lists all musics", %{conn: conn} do
      conn = get(conn, Routes.music_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Musics"
    end
  end

  describe "new music" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.music_path(conn, :new))
      assert html_response(conn, 200) =~ "New Music"
    end
  end

  describe "create music" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.music_path(conn, :create), music: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.music_path(conn, :show, id)

      conn = get(conn, Routes.music_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Music"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.music_path(conn, :create), music: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Music"
    end
  end

  describe "edit music" do
    setup [:create_music]

    test "renders form for editing chosen music", %{conn: conn, music: music} do
      conn = get(conn, Routes.music_path(conn, :edit, music))
      assert html_response(conn, 200) =~ "Edit Music"
    end
  end

  describe "update music" do
    setup [:create_music]

    test "redirects when data is valid", %{conn: conn, music: music} do
      conn = put(conn, Routes.music_path(conn, :update, music), music: @update_attrs)
      assert redirected_to(conn) == Routes.music_path(conn, :show, music)

      conn = get(conn, Routes.music_path(conn, :show, music))
      assert html_response(conn, 200) =~ "some updated album"
    end

    test "renders errors when data is invalid", %{conn: conn, music: music} do
      conn = put(conn, Routes.music_path(conn, :update, music), music: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Music"
    end
  end

  describe "delete music" do
    setup [:create_music]

    test "deletes chosen music", %{conn: conn, music: music} do
      conn = delete(conn, Routes.music_path(conn, :delete, music))
      assert redirected_to(conn) == Routes.music_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.music_path(conn, :show, music))
      end
    end
  end

  defp create_music(_) do
    music = music_fixture()
    %{music: music}
  end
end
