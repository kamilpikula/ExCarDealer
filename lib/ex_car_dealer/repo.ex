defmodule ExCarDealer.Repo do
  use Ecto.Repo,
    otp_app: :ex_car_dealer,
    adapter: Ecto.Adapters.Postgres
end
