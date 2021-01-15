defmodule ExCarDealerWeb.MainController do
  use ExCarDealerWeb, :controller

  def index(conn, _params) do
    IO.inspect(conn)
    render(conn, "index.html")
  end
end
