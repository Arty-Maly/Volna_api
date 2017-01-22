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




Enum.each(stations, fn({key, [url, position, image]}) ->
  VolnaApi.Repo.insert!(%VolnaApi.RadioStation{
    name: key,
    url: url,
    position: position,
    image: image
    })
end)

# VolnaApi.Repo.insert!(%VolnaApi.SomeModel{})
