defmodule ExCarDealerWeb.SessionController do
  use ExCarDealerWeb, :controller

  def new(conn, _params) do
    changeset = Pow.Plug.change_user(conn)

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    conn
    |> Pow.Plug.authenticate_user(user_params) |> IO.inspect()
    |> case do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Witamy ponownie, #{conn.assigns.current_user.first_name}")
        |> redirect(to: Routes.main_path(conn, :index))

      {:error, conn} ->
        changeset = Pow.Plug.change_user(conn, conn.params["user"])

        conn
        |> put_flash(:info, "Nieznany mail lub hasło")
        |> render("new.html", changeset: changeset)
    end
  end

  def delete(conn, _params) do
    conn
    |> Pow.Plug.delete()
    |> redirect(to: Routes.home_path(conn, :index))
  end
end
