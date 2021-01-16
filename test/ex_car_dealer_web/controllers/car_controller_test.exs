defmodule ExCarDealerWeb.CarControllerTest do
  use ExCarDealerWeb.ConnCase

  alias ExCarDealer.Cars

  @create_attrs %{
    brand: "some brand",
    condition: "some condition",
    model: "some model",
    price: 120.5,
    year: 42
  }
  @update_attrs %{
    brand: "some updated brand",
    condition: "some updated condition",
    model: "some updated model",
    price: 456.7,
    year: 43
  }
  @invalid_attrs %{brand: nil, condition: nil, model: nil, price: nil, year: nil}

  def fixture(:car) do
    {:ok, car} = Cars.create_car(@create_attrs)
    car
  end

  describe "index" do
    test "lists all cars", %{conn: conn} do
      conn = get(conn, Routes.car_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Cars"
    end
  end

  describe "new car" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.car_path(conn, :new))
      assert html_response(conn, 200) =~ "New Car"
    end
  end

  describe "create car" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.car_path(conn, :create), car: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.car_path(conn, :show, id)

      conn = get(conn, Routes.car_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Car"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.car_path(conn, :create), car: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Car"
    end
  end

  describe "edit car" do
    setup [:create_car]

    test "renders form for editing chosen car", %{conn: conn, car: car} do
      conn = get(conn, Routes.car_path(conn, :edit, car))
      assert html_response(conn, 200) =~ "Edit Car"
    end
  end

  describe "update car" do
    setup [:create_car]

    test "redirects when data is valid", %{conn: conn, car: car} do
      conn = put(conn, Routes.car_path(conn, :update, car), car: @update_attrs)
      assert redirected_to(conn) == Routes.car_path(conn, :show, car)

      conn = get(conn, Routes.car_path(conn, :show, car))
      assert html_response(conn, 200) =~ "some updated brand"
    end

    test "renders errors when data is invalid", %{conn: conn, car: car} do
      conn = put(conn, Routes.car_path(conn, :update, car), car: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Car"
    end
  end

  describe "delete car" do
    setup [:create_car]

    test "deletes chosen car", %{conn: conn, car: car} do
      conn = delete(conn, Routes.car_path(conn, :delete, car))
      assert redirected_to(conn) == Routes.car_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.car_path(conn, :show, car))
      end
    end
  end

  defp create_car(_) do
    car = fixture(:car)
    %{car: car}
  end
end
