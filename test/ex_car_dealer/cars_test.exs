defmodule ExCarDealer.CarsTest do
  use ExCarDealer.DataCase

  alias ExCarDealer.Cars

  describe "cars" do
    alias ExCarDealer.Cars.Car

    @valid_attrs %{brand: "some brand", condition: "some condition", model: "some model", price: 120.5, year: 42}
    @update_attrs %{brand: "some updated brand", condition: "some updated condition", model: "some updated model", price: 456.7, year: 43}
    @invalid_attrs %{brand: nil, condition: nil, model: nil, price: nil, year: nil}

    def car_fixture(attrs \\ %{}) do
      {:ok, car} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Cars.create_car()

      car
    end

    test "list_cars/0 returns all cars" do
      car = car_fixture()
      assert Cars.list_cars() == [car]
    end

    test "get_car!/1 returns the car with given id" do
      car = car_fixture()
      assert Cars.get_car!(car.id) == car
    end

    test "create_car/1 with valid data creates a car" do
      assert {:ok, %Car{} = car} = Cars.create_car(@valid_attrs)
      assert car.brand == "some brand"
      assert car.condition == "some condition"
      assert car.model == "some model"
      assert car.price == 120.5
      assert car.year == 42
    end

    test "create_car/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cars.create_car(@invalid_attrs)
    end

    test "update_car/2 with valid data updates the car" do
      car = car_fixture()
      assert {:ok, %Car{} = car} = Cars.update_car(car, @update_attrs)
      assert car.brand == "some updated brand"
      assert car.condition == "some updated condition"
      assert car.model == "some updated model"
      assert car.price == 456.7
      assert car.year == 43
    end

    test "update_car/2 with invalid data returns error changeset" do
      car = car_fixture()
      assert {:error, %Ecto.Changeset{}} = Cars.update_car(car, @invalid_attrs)
      assert car == Cars.get_car!(car.id)
    end

    test "delete_car/1 deletes the car" do
      car = car_fixture()
      assert {:ok, %Car{}} = Cars.delete_car(car)
      assert_raise Ecto.NoResultsError, fn -> Cars.get_car!(car.id) end
    end

    test "change_car/1 returns a car changeset" do
      car = car_fixture()
      assert %Ecto.Changeset{} = Cars.change_car(car)
    end
  end
end
