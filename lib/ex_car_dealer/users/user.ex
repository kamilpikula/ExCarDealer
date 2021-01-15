defmodule ExCarDealer.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    pow_user_fields()

    timestamps()
  end

  def changeset(user_or_changeset, attrs) do
    user_or_changeset
    |> pow_changeset(attrs)
    |> Ecto.Changeset.cast(attrs, [:first_name, :last_name])
    |> Ecto.Changeset.validate_length(:first_name, min: 3)
  end
end
