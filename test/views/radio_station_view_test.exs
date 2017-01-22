defmodule VolnaApi.RadioStationViewTest do
  use VolnaApi.ModelCase
  import VolnaApi.Factory
  alias VolnaApi.RadioStationView

  test "to_json" do
    radio_station = insert(:radio_station)

    rendered_json = RadioStationView.to_json(radio_station)
    assert rendered_json == %{
      name: radio_station.name,
      url: radio_station.url,
      position: radio_station.position,
      image: nil
    }
  end

  test "index.json" do
    radio_station = insert(:radio_station)

    rendered_json = RadioStationView.render("index.json", %{radio_stations: [radio_station]})

    assert rendered_json == %{
      stations: [RadioStationView.to_json(radio_station)]
    }
  end
end