# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     VolnaApi.Repo.insert!(%VolnaApi.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.



Enum.each(radio_stations, fn({name, info}) ->
  VolnaApi.Repo.insert!(%VolnaApi.RadioStation{
    name: name,
    url: info["url"],
    position: info["position"],
    image: info["image"]
    })
end)