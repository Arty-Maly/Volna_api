
require IEx
defmodule VolnaApi.RadioStationController do
  use VolnaApi.Web, :controller

  alias VolnaApi.RadioStation

  def index(conn, params) do
    uuid = params["uuid"]
    IEx.pry
    if uuid do
      # device = Repo.get_by(VolnaApi.Device, uuid: uuid)
      radio_stations = [%{"url" => "http://78.110.61.92:8000/nrj256","position"=>29,"name"=>"NRJ","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/nrj.png"},%{"url"=>"http://78.110.61.92:8000/keks128","position"=>13,"name"=>"Кекс","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/keks.png"},%{"url"=>"http://78.110.61.92:8000","position"=>32,"name"=>"Комсомольская Правда","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/komsomol.png"},%{"url"=>"http://78.110.61.92:8000/alexm320","position"=>37,"name"=>"Alex-M","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/alexm.png"},%{"url"=>"http://78.110.61.92:8000/record128","position"=>3,"name"=>"Record","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/record.png"},%{"url"=>"http://78.110.61.92:8000/comedy","position"=>22,"name"=>"Comedy","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/comedy.png"},%{"url"=>"http://78.110.61.92:8000/okradio128","position"=>36,"name"=>"Радио ОК","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/ok.png"},%{"url"=>"http://78.110.61.92:8000/sport128","position"=>14,"name"=>"Радио Спорт","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/sport.png"},%{"url"=>"http://78.110.61.92:8000/lradio96","position"=>12,"name"=>"L Radio","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/lradio.png"},%{"url"=>"http://78.110.61.92:8000/mvd128","position"=>31,"name"=>"Милицейская Волна","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/militia.png"},%{"url"=>"http://78.110.61.92:8000/govoritmoskva96","position"=>20,"name"=>"Говорит Москва","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/moscow.png"},%{"url"=>"http://78.110.61.92:8000/dacha","position"=>4,"name"=>"Дача","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/dacha.png"},%{"url"=>"http://78.110.61.92:8000/dfm","position"=>6,"name"=>"Dfm","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/dfm.png"},%{"url"=>"http://78.110.61.92:8000/radiorosii128","position"=>26,"name"=>"Радио России","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/rossii.png"},%{"url"=>"http://78.110.61.92:8000/radio107_128","position"=>39,"name"=>"Радио 107","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/107.png"},%{"url"=>"http://78.110.61.92:8000/echo","position"=>0,"name"=>"Echo FM","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/exo.png"},%{"url"=>"http://78.110.61.92:8000/kommersant128","position"=>42,"name"=>"Коммерсант","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/kommersant.png"},%{"url"=>"http://78.110.61.92:8000/humor256","position"=>28,"name"=>"Юмор","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/humor.png"},%{"url"=>"http://78.110.61.92:8000/bolshoe128","position"=>38,"name"=>"Большое Радио","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/bolshoe.png"},%{"url"=>"http://78.110.61.92:8000/kurs","position"=>41,"name"=>"Курс","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/kurs.png"},%{"url"=>"http://78.110.61.92:8000/rock128","position"=>23,"name"=>"Rock FM","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/rock.png"},%{"url"=>"http://78.110.61.92:8000/svoboda","position"=>27,"name"=>"Радио Свобода","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/svoboda.png"},%{"url"=>"http://78.110.61.92:8000/jazz128","position"=>16,"name"=>"Джаз","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/jazz.png"},%{"url"=>"http://78.110.61.92:8000/megapolis128","position"=>35,"name"=>"Мегаполис","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/megapolis.png"},%{"url"=>"http://78.110.61.92:8000/eldoradio128","position"=>11,"name"=>"Эльдорадио","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/eldoradio.png"},%{"url"=>"http://78.110.61.92:8000/borneo128","position"=>40,"name"=>"Борнео","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/borneo.png"},%{"url"=>"http://78.110.61.92:8000/rr96","position"=>2,"name"=>"Руссое Радио","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/rr.png"},%{"url"=>"http://78.110.61.92:8000/nashe128","position"=>5,"name"=>"Наше","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/nashe.png"},%{"url"=>"http://78.110.61.92:8000/chocolate128","position"=>19,"name"=>"Шоколад","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/chocolate.png"},%{"url"=>"http://78.110.61.92:8000/pioner128","position"=>15,"name"=>"Пионер","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/pioneer.jpg"},%{"url"=>"http://78.110.61.92:8000/avtoradio","position"=>25,"name"=>"АвтоРадио","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/avto.png"},%{"url"=>"http://78.110.61.92:8000/ultra128","position"=>7,"name"=>"Ultra","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/ultra.png"},%{"url"=>"http://78.110.61.92:8000/gorodfm128","position"=>33,"name"=>"Город","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/gorod.png"},%{"url"=>"http://78.110.61.92:8000/uniton128","position"=>17,"name"=>"Юнитон","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/uniton.png"},%{"url"=>"http://78.110.61.92:8000/rsn","position"=>43,"name"=>"Рус Новости","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/rsn.png"},%{"url"=>"http://78.110.61.92:8000/best128","position"=>8,"name"=>"Best FM","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/best.png"},%{"url"=>"http://78.110.61.92:8000/mcm128","position"=>30,"name"=>"МСМ Иркутск","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/mcm.png"},%{"url"=>"http://78.110.61.92:8000/zvezda128","position"=>24,"name"=>"Звезда","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/zvezda.png"},%{"url"=>"http://78.110.61.92:8000/orpheus128","position"=>18,"name"=>"Орфей","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/orfei.png"},%{"url"=>"http://78.110.61.92:8000/chanson128","position"=>9,"name"=>"Шансон","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/shanson.png"},%{"url"=>"http://78.110.61.92:8000/bfm96","position"=>1,"name"=>"Business FM","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/bfm.png"},%{"url"=>"http://78.110.61.92:8000/romantika256","position"=>34,"name"=>"Романтика","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/romantika.png"},%{"url"=>"http://78.110.61.92:8000/zenit128","position"=>10,"name"=>"Зенит","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/zenit.png"},%{"url"=>"http://78.110.61.92:8000/rushit48","position"=>21,"name"=>"Русский Хит","image"=>"http://yenisei.s3-website.eu-central-1.amazonaws.com/stations/ru_hit.png"}]
      render(conn, "index.json", radio_stations: radio_stations)
      # if device do
      #   if device.need_sync do
      #     render(conn, "index.json", radio_stations: radio_stations)
      #   else
      #     #for testing and development purposes always return the list even if no sync needed
      #     render(conn, "index.json", radio_stations: radio_stations)
      #   end
      # else
      #   changeset = VolnaApi.Device.changeset(%VolnaApi.Device{}, %{uuid: uuid})
      #   Repo.insert(changeset)
      #   render(conn, "index.json", radio_stations: radio_stations)
      # end
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
