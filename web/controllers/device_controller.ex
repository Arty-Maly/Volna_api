defmodule VolnaApi.DeviceController do
  use VolnaApi.Web, :controller
  alias VolnaApi.Device

  def index(conn, params) do
    devices = Repo.all(Device)

    render(conn, "index.html", devices: devices)
  end

  alias VolnaApi.Device
end