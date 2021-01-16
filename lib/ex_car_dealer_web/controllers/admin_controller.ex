defmodule ExCarDealerWeb.AdminController do
  use ExCarDealerWeb, :controller

  alias ExCarDealer.{Users, Cars}

  def index(conn, _params) do
    render(conn, "index.html",
      users: Users.list_users(),
      cars: Cars.list_cars()
    )
  end
end
