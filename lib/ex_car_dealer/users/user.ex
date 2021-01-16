defmodule ExCarDealer.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :role, :string, null: false, default: "user"

    has_one :car, ExCarDealer.Cars.Car
    pow_user_fields()

    timestamps()
  end

  @spec changeset(Ecto.Schema.t() | Ecto.Changeset.t(), map()) :: Ecto.Changeset.t()
  def changeset(user_or_changeset, attrs) do
    user_or_changeset
    |> pow_changeset(attrs)
    |> Ecto.Changeset.cast(attrs, [:first_name, :last_name])
    |> Ecto.Changeset.unique_constraint(:email)
    |> Ecto.Changeset.validate_length(:first_name, min: 3)
  end

  @spec changeset_role(Ecto.Schema.t() | Ecto.Changeset.t(), map()) :: Ecto.Changeset.t()
  def changeset_role(user_or_changeset, attrs) do
    user_or_changeset
    |> Ecto.Changeset.cast(attrs, [:role])
    |> Ecto.Changeset.validate_inclusion(:role, ~w(user admin))
  end
end
