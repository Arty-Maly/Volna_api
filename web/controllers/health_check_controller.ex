defmodule VolnaApi.HealthCheckController do
  use VolnaApi.Web, :controller

  alias VolnaApi.RadioStation

  def index(conn, _params) do
    RadioStations = Repo.all(RadioStation)
    render(conn, "index.html", RadioStations: RadioStations)
  end

  def show(conn, %{"id" => id}) do
    stations = from(station in RadioStation, where: station.country == ^id, select: {station.name, station.url})
               |> Repo.all()
    HTTPotion.start()
    checked =
      stations
        |> Enum.map(&Task.async(fn ->
            async_get_request(&1)
           end))
        |> Enum.map(&Task.await/1)
    render(conn, "show.html", stations: checked)
  end

  defp await(var) do
    try do
      Task.await(var, 60000)
    catch _ ->
      {1,1,"red"}
    end
  end

  defp async_get_request(station) do

    case HTTPotion.get(elem(station, 1), [follow_redirects: true, stream_to: self, timeout: 10_000]) do
        %HTTPotion.AsyncResponse{id: id} ->
          receive do
            %HTTPotion.AsyncHeaders{status_code: status_code, headers: headers} ->
              case Enum.find(headers.hdrs, &(match?({"content-type", "audio/" <> _}, &1))) do
                nil ->
                  Tuple.append(station, "red")
                _ ->
                  Tuple.append(station, "green")
              end
            %HTTPotion.ErrorResponse{message: message} ->
              Tuple.append(station, "red")
            _ ->
              Tuple.append(station, "red")
          end
        _ ->
          Tuple.append(station, "red")
    end
  end

  defp get_audio_header(headers) do
    Enum.find(headers, &(match?({"Content-Type", "audio/" <> _}, &1)))
  end

  defp get_result() do
    receive do
      {:result, result} -> result
    end
  end
end
