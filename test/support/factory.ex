defmodule VolnaApi.Factory do
  use ExMachina.Ecto, repo: VolnaApi.Repo

  def radio_station_factory do
    %VolnaApi.RadioStation{
      name: "Cool Radio",
      url: "www.coolradio.com"
    }
  end

  def device_factory do
    %VolnaApi.Device{
      uuid: "abc"
    }
  end
end