defmodule VolnaApi.RadioStationControllerTest do
  use VolnaApi.ConnCase

  import VolnaApi.Factory

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "index renders all the radio stations if a uuid param is present" do
    radio_station = insert(:radio_station)
    conn = build_conn()
    conn = get conn, radio_station_path(conn, :index) <> "?uuid=123"

    assert json_response(conn, 200) == render_json("index.json", radio_stations: [radio_station])
  end

  test "index renders empty response if no uuid is present" do
    insert(:radio_station)
    conn = build_conn()
    conn = get conn, radio_station_path(conn, :index)

    assert json_response(conn, 200) == render_json("index.json", radio_stations: [])
  end

  test "creates a new device if the uuid is not present in the database" do
    conn = build_conn()

    get conn, radio_station_path(conn, :index) <> "?uuid=123"

    assert VolnaApi.Repo.get_by(VolnaApi.Device, uuid: "123")
  end

  defp render_json(template, assigns) do
    assigns = Map.new(assigns)

    VolnaApi.RadioStationView.render(template, assigns)
    |> Poison.encode!
    |> Poison.decode!
  end
end
