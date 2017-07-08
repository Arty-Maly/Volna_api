defmodule VolnaApi.RadioStationController do
  use VolnaApi.Web, :controller

  alias VolnaApi.RadioStation
  alias VolnaApi.Device
  alias Ecto.Multi

  def index(conn, params) do
    uuid = params["uuid"]
    country = params["country"] || "ru"
    if uuid do
      device = Repo.get_by(Device, uuid: uuid)
      # query = from(station in RadioStation, where: station.country == country)
      radio_stations = Repo.all(from station in RadioStation, where: station.country == ^country)
      if device do
        device_changeset = Device.changeset(device, %{times_synced: device.times_synced + 1})
        Repo.update(device_changeset)
        render(conn, "index.json", radio_stations: radio_stations)
      else
        changeset = VolnaApi.Device.changeset(%VolnaApi.Device{}, %{uuid: uuid})
        Repo.insert(changeset)
        render(conn, "index.json", radio_stations: radio_stations)
      end
    else
      render(conn, "index.json", radio_stations: [])
    end
  end

  def show(conn, params) do
    stations = Repo.all(RadioStation)

    render(conn, "show.html", stations: stations)
  end

  def edit(conn, params) do
    name = params["id"]
    station = Repo.get_by(RadioStation, name: name)

    render(conn, "edit.html", changeset: RadioStation.changeset(station), station: station)
  end

  def delete(conn, params) do
    name = params["id"]
    station = Repo.get_by(RadioStation, id: name)

    case Repo.delete(station)  do
      {:ok, _radio_station} ->
        shift_station_positions(station)
        conn
        |> put_flash(:info, "Radio Station #{station.name} deleted")
        |> redirect(to: radio_station_path(conn, :show))
      {:error, changeset} ->
        conn
        |> put_flash(:info, "Radio Station #{station.name} NOT deleted")
        |> redirect(to: radio_station_path(conn, :show))
    end
  end

  def update(conn, %{"id" => id, "radio_station" => radio_station_params}) do
    radio_station = Repo.get(RadioStation, id)
    changeset = RadioStation.changeset(radio_station, radio_station_params)
    case Repo.update(changeset) do
      {:ok, _radio_station} ->
        conn
        |> put_flash(:info, "Radio Station #{radio_station.name} updated")
        |> redirect(to: radio_station_path(conn, :show))
      {:error, changeset} ->
        conn
        |> put_flash(:info, "Radio Station #{radio_station.name} NOT updated")
        |> redirect(to: radio_station_path(conn, :show))
    end
  end

  def new(conn, _params) do
    changeset = RadioStation.changeset(%RadioStation{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"radio_station" => radio_station_params}) do
    changeset = RadioStation.changeset(%RadioStation{}, radio_station_params)
    case Repo.insert(changeset) do
      {:ok, _radio_station} ->
        conn
        |> put_flash(:info, "radio_station created successfully.")
        |> redirect(to: radio_station_path(conn, :show))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  defp shift_station_positions(radio_station) do
    radio_stations = Repo.all(from station in RadioStation,
      where: station.position > ^radio_station.position,
      where: station.country == ^radio_station.country)
    response = {:ok, radio_stations}
    for station <- radio_stations do
      radio_station_changeset = RadioStation.changeset(station, %{position: decrement(station)})
      case Repo.update(radio_station_changeset) do
        {:error, changeset} ->
          response = {:error, changeset}
        {:ok, changeset} ->
          response = {:ok, radio_stations}
      end
    end
  end

  defp decrement(station) do
    Integer.to_string(String.to_integer(station.position) - 1)
  end
end
