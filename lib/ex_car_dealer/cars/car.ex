defmodule ExCarDealer.Cars.Car do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cars" do
    field :brand, :string
    field :condition, :string
    field :model, :string
    field :price, :integer
    field :year, :integer
    field :user_id, :id
    field :image_url, :string
    timestamps()
  end

  @doc false
  def changeset(car, attrs) do
    car
    |> cast(attrs, [:brand, :model, :price, :condition, :year])
    |> validate_required([:brand, :model, :price, :condition, :year])
  end
end
