defmodule ExCarDealerWeb.AuthErrorHandler do
  use ExCarDealerWeb, :controller
  alias Plug.Conn

  @spec call(Conn.t(), atom()) :: Conn.t()
  def call(conn, :not_authenticated) do
    conn
    |> put_flash(:error, "Jesteś niezalogowany!")
    |> redirect(to: Routes.session_path(conn, :new))
  end

  @spec call(Conn.t(), atom()) :: Conn.t()
  def call(conn, :already_authenticated) do
    conn
    |> put_flash(:error, "Jesteś zalogowany")
    |> redirect(to: Routes.home_path(conn, :index))
  end
end
