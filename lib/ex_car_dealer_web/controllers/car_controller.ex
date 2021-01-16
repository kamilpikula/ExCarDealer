defmodule ExCarDealerWeb.CarController do
  use ExCarDealerWeb, :controller

  alias ExCarDealer.Cars
  alias ExCarDealer.Cars.Car

  def index(conn, _params) do
    cars = Cars.list_cars()
    render(conn, "index.html", cars: cars)
  end

  def new(conn, _params) do
    changeset = Cars.change_car(%Car{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"car" => car_params}) do
    case Cars.create_car(car_params) do
      {:ok, car} ->
        conn
        |> put_flash(:info, "Samochód został dodany!")
        |> redirect(to: Routes.admin_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    car = Cars.get_car!(id)
    render(conn, "show.html", car: car)
  end

  def edit(conn, %{"id" => id}) do
    car = Cars.get_car!(id)
    changeset = Cars.change_car(car)
    render(conn, "edit.html", car: car, changeset: changeset)
  end

  def update(conn, %{"id" => id, "car" => car_params}) do
    car = Cars.get_car!(id)

    case Cars.update_car(car, car_params) do
      {:ok, car} ->
        conn
        |> put_flash(:info, "Car updated successfully.")
        |> redirect(to: Routes.car_path(conn, :show, car))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", car: car, changeset: changeset)
    end
  end

  def reservation(conn, %{"id" => id}) do
    car = Cars.get_car!(id)
    user_id = conn.assigns.current_user.id
    IO.inspect(conn)

    case Cars.update_car(car, %{"user_id" => user_id}) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Samochód został zarezerwowany, odezwiemy się w ciągu 12h!")
        |> redirect(to: Routes.main_path(conn, :index))

      {:error, _} ->
        conn
        |> put_flash(:info, "Nie mozna zarezerwować, przepraszamy. :(")
        |> redirect(to: Routes.main_path(conn, :index))
    end
  end

  def delete(conn, %{"id" => id}) do
    car = Cars.get_car!(id)
    {:ok, _car} = Cars.delete_car(car)

    conn
    |> put_flash(:info, "Samochód pomyślnie usunięto.")
    |> redirect(to: Routes.car_path(conn, :index))
  end
end
