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
    HTTPoison.start()
    checked =
      stations
        |> Enum.map(&async_get_request(&1))
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
    case HTTPoison.head(elem(station, 1), [], [hackney: [{:follow_redirect, true}, :insecure]]) do
        {:ok, %HTTPoison.Response{status_code: status_code, headers: headers}} ->
          case Enum.find(headers, &(match?({"Content-Type", "audio/" <> _}, &1))) do
            nil ->
              Tuple.append(station, "red")
            _ ->
              Tuple.append(station, "green")
          end
        {:error, %HTTPoison.Error{reason: reason}} ->
          Tuple.append(station, "red")
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
