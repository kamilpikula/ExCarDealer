# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ExCarDealer.Repo.insert!(%ExCarDealer.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias ExCarDealer.Repo
alias ExCarDealer.Users.User
alias ExCarDealer.Cars.Car

# USERS
Repo.insert!(%User{
  current_password: nil,
  email: "pikusix1@o2.pl",
  first_name: "Kamil",
  id: 5,
  inserted_at: ~N[2021-01-15 22:51:52],
  last_name: "Pikula",
  password: nil,
  password_hash:
    "$pbkdf2-sha512$100000$hCNaClINNjgPrlcC4Wuxxg==$nCrii14Oe4lyeOVkm7beMtT7yfuVOpntDTdY2RiRBjlHop/+STjLHOFf/W2SHxPrzgCbf1y/WgmvGaTx8xtLyw==",
  role: "admin",
  updated_at: ~N[2021-01-15 22:51:52]
})

Repo.insert!(%User{
  current_password: nil,
  email: "test1@example.com",
  first_name: "Jan",
  id: 6,
  inserted_at: ~N[2021-01-15 22:51:52],
  last_name: "Nowak",
  password: nil,
  password_hash:
    "$pbkdf2-sha512$100000$hCNaClINNjgPrlcC4Wuxxg==$nCrii14Oe4lyeOVkm7beMtT7yfuVOpntDTdY2RiRBjlHop/+STjLHOFf/W2SHxPrzgCbf1y/WgmvGaTx8xtLyw==",
  role: "user",
  updated_at: ~N[2021-01-15 22:51:52]
})

Repo.insert!(%User{
  current_password: nil,
  email: "jacek.kowalski@gmail.com",
  first_name: "Jacek",
  id: 7,
  inserted_at: ~N[2021-01-15 22:51:52],
  last_name: "Kowalski",
  password: nil,
  password_hash:
    "$pbkdf2-sha512$100000$hCNaClINNjgPrlcC4Wuxxg==$nCrii14Oe4lyeOVkm7beMtT7yfuVOpntDTdY2RiRBjlHop/+STjLHOFf/W2SHxPrzgCbf1y/WgmvGaTx8xtLyw==",
  role: "user",
  updated_at: ~N[2021-01-15 22:51:52]
})

Repo.insert!(%User{
  current_password: nil,
  email: "a.nowicka@test.pl",
  first_name: "Ania",
  id: 8,
  inserted_at: ~N[2021-01-15 22:51:52],
  last_name: "Nowicka",
  password: nil,
  password_hash:
    "$pbkdf2-sha512$100000$hCNaClINNjgPrlcC4Wuxxg==$nCrii14Oe4lyeOVkm7beMtT7yfuVOpntDTdY2RiRBjlHop/+STjLHOFf/W2SHxPrzgCbf1y/WgmvGaTx8xtLyw==",
  role: "admin",
  updated_at: ~N[2021-01-15 22:51:52]
})

# CARS
Repo.insert!(%Car{
  brand: "BMW",
  condition: "Uzywany",
  id: 5,
  image_url:
    "https://uzywane.gazdagroupdabrowa.pl/application/files/6515/7502/5351/BMW-G30-22.jpg",
  inserted_at: ~N[2021-01-16 00:56:45],
  model: "540d",
  price: 65_500,
  updated_at: ~N[2021-01-16 00:56:45],
  user_id: 6,
  year: 2017
})

Repo.insert!(%Car{
  brand: "BMW",
  condition: "Nowy",
  id: 6,
  image_url:
    "https://uzywane.gazdagroupdabrowa.pl/application/files/6515/7502/5351/BMW-G30-22.jpg",
  inserted_at: ~N[2021-01-16 00:56:45],
  model: "540d",
  price: 50_000,
  updated_at: ~N[2021-01-16 00:56:45],
  user_id: 7,
  year: 2018
})

Repo.insert!(%Car{
  brand: "Audi",
  condition: "Uzywany",
  id: 7,
  image_url: "https://i.wpimg.pl/730x0/m.autokult.pl/autowp-ru-audi-a4-2-0t-s-831475d.jpg",
  inserted_at: ~N[2021-01-16 03:33:34],
  model: "A4",
  price: 15_750,
  updated_at: ~N[2021-01-16 03:33:34],
  user_id: nil,
  year: 2012
})
