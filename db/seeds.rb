# https://github.com/stympy/faker

Song.destroy_all

10.times do
  Song.create({
    title: Faker::WorldCup.team,
    released: true,
    release_year: rand(1956..2014),
    artist_name: Faker::Music::RockBand.name,
    genre: Faker::Music.genre
  })
end