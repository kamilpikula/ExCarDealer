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
  id: 1,
  inserted_at: ~N[2021-01-15 22:51:52],
  last_name: "Pikula",
  password: nil,
  password_hash: "$pbkdf2-sha512$100000$hCNaClINNjgPrlcC4Wuxxg==$nCrii14Oe4lyeOVkm7beMtT7yfuVOpntDTdY2RiRBjlHop/+STjLHOFf/W2SHxPrzgCbf1y/WgmvGaTx8xtLyw==",
  role: "admin",
  updated_at: ~N[2021-01-15 22:51:52]
})

Repo.insert!(%User{
  current_password: nil,
  email: "test1@example.com",
  first_name: "Jan",
  id: 2,
  inserted_at: ~N[2021-01-15 22:51:52],
  last_name: "Nowak",
  password: nil,
  password_hash: "$pbkdf2-sha512$100000$hCNaClINNjgPrlcC4Wuxxg==$nCrii14Oe4lyeOVkm7beMtT7yfuVOpntDTdY2RiRBjlHop/+STjLHOFf/W2SHxPrzgCbf1y/WgmvGaTx8xtLyw==",
  role: "user",
  updated_at: ~N[2021-01-15 22:51:52]
})

Repo.insert!(%User{
  current_password: nil,
  email: "jacek.kowalski@gmail.com",
  first_name: "Jacek",
  id: 3,
  inserted_at: ~N[2021-01-15 22:51:52],
  last_name: "Kowalski",
  password: nil,
  password_hash: "$pbkdf2-sha512$100000$hCNaClINNjgPrlcC4Wuxxg==$nCrii14Oe4lyeOVkm7beMtT7yfuVOpntDTdY2RiRBjlHop/+STjLHOFf/W2SHxPrzgCbf1y/WgmvGaTx8xtLyw==",
  role: "user",
  updated_at: ~N[2021-01-15 22:51:52]
})

Repo.insert!(%User{
  current_password: nil,
  email: "a.nowicka@test.pl",
  first_name: "Ania",
  id: 4,
  inserted_at: ~N[2021-01-15 22:51:52],
  last_name: "Nowicka",
  password: nil,
  password_hash: "$pbkdf2-sha512$100000$hCNaClINNjgPrlcC4Wuxxg==$nCrii14Oe4lyeOVkm7beMtT7yfuVOpntDTdY2RiRBjlHop/+STjLHOFf/W2SHxPrzgCbf1y/WgmvGaTx8xtLyw==",
  role: "admin",
  updated_at: ~N[2021-01-15 22:51:52]
})

# CARS
Repo.insert!(%Car{
  brand: "BMW",
  condition: "Uzywany",
  id: 1,
  image_url: "https://uzywane.gazdagroupdabrowa.pl/application/files/6515/7502/5351/BMW-G30-22.jpg",
  inserted_at: ~N[2021-01-16 00:56:45],
  model: "540d",
  price: 65_500,
  updated_at: ~N[2021-01-16 00:56:45],
  user_id: 2,
  year: 2017
})

Repo.insert!(%Car{
  brand: "BMW",
  condition: "Nowy",
  id: 2,
  image_url: "https://uzywane.gazdagroupdabrowa.pl/application/files/6515/7502/5351/BMW-G30-22.jpg",
  inserted_at: ~N[2021-01-16 00:56:45],
  model: "540d",
  price: 50_000,
  updated_at: ~N[2021-01-16 00:56:45],
  user_id: 3,
  year: 2018
})
