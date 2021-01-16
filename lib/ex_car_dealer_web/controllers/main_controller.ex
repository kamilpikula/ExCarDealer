defmodule ExCarDealerWeb.MainController do
  use ExCarDealerWeb, :controller

  def index(conn, _params) do
    cars = ExCarDealer.Cars.list_cars()
    render(conn, "index.html", cars: cars)
  end
end
