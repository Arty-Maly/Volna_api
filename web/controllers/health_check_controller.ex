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
    checked =
      stations
        |> Enum.map(&Task.async(fn ->
              try do
                async_get_request(&1)
              catch type, error ->
                {"BLA"}
              end
           end))
        |> Enum.map(&await/1)
      # |> fn -> IO.puts(&1) end
      # case HTTPoison.get(elem(station, 1)) do
      #   {:ok, %{status_code: 200}} ->
      #     append(station, "green")
      #   {:ok, %HTTPoison.Response{status_code: 404}} ->
      #     append(station, "red")
      #   {:error, %HTTPoison.Error{reason: reason}} ->
      #     append(station, "red")
      #   ->
      #     append(station, "red")
      # end
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
    HTTPoison.start()
    case HTTPoison.get(elem(station, 1), [], hackney: [:insecure]) do
        {:ok, %{status_code: 200}} ->
          Tuple.append(station, "green")
        {:ok, %HTTPoison.Response{status_code: 404}} ->
          Tuple.append(station, "red")
        {:error, %HTTPoison.Error{reason: reason}} ->
          Tuple.append(station, "red")
        _ ->
          Tuple.append(station, "red")
    end
  end

  defp get_result() do
    receive do
      {:result, result} -> result
    end
  end
end
