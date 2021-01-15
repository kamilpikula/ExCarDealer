defmodule ExCarDealerWeb.AdminController do
  use ExCarDealerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
