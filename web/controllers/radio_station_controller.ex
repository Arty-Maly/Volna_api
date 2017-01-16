
defmodule VolnaApi.RadioStationController do
  use VolnaApi.Web, :controller

  alias VolnaApi.RadioStation

  def index(conn, params) do
    uuid = params["uuid"]
    if uuid do
      device = Repo.get_by(VolnaApi.Device, uuid: uuid)
      radio_stations = Repo.all(RadioStation)
      if device do
        if device.need_sync do
          render(conn, "index.json", radio_stations: radio_stations)
        else
          render(conn, "index.json", radio_stations: [])
        end
      else
        changeset = VolnaApi.Device.changeset(%VolnaApi.Device{}, %{uuid: uuid})
        Repo.insert(changeset)
        render(conn, "index.json", radio_stations: radio_stations)
      end
    else
      render(conn, "index.json", radio_stations: [])
    end
  end
end

# Leaving this for now
#   def index(conn, _params) do
#     radio_stations = Repo.all(RadioStation)
#     render(conn, "index.json", radio_stations: radio_stations)
#   end

#   def create(conn, %{"radio_station" => radio_station_params}) do
#     changeset = RadioStation.changeset(%RadioStation{}, radio_station_params)

#     case Repo.insert(changeset) do
#       {:ok, radio_station} ->
#         conn
#         |> put_status(:created)
#         |> put_resp_header("location", radio_station_path(conn, :show, radio_station))
#         |> render("show.json", radio_station: radio_station)
#       {:error, changeset} ->
#         conn
#         |> put_status(:unprocessable_entity)
#         |> render(VolnaApi.ChangesetView, "error.json", changeset: changeset)
#     end
#   end

#   def show(conn, %{"id" => id}) do
#     radio_station = Repo.get!(RadioStation, id)
#     render(conn, "show.json", radio_station: radio_station)
#   end

#   def update(conn, %{"id" => id, "radio_station" => radio_station_params}) do
#     radio_station = Repo.get!(RadioStation, id)
#     changeset = RadioStation.changeset(radio_station, radio_station_params)

#     case Repo.update(changeset) do
#       {:ok, radio_station} ->
#         render(conn, "show.json", radio_station: radio_station)
#       {:error, changeset} ->
#         conn
#         |> put_status(:unprocessable_entity)
#         |> render(VolnaApi.ChangesetView, "error.json", changeset: changeset)
#     end
#   end

#   def delete(conn, %{"id" => id}) do
#     radio_station = Repo.get!(RadioStation, id)

#     # Here we use delete! (with a bang) because we expect
#     # it to always work (and if it does not, it will raise).
#     Repo.delete!(radio_station)

#     send_resp(conn, :no_content, "")
#   end
# end
