defmodule ExCarDealer.Repo.Migrations.CreateCars do
  use Ecto.Migration

  def change do
    create table(:cars) do
      add :brand, :string
      add :model, :string
      add :price, :float
      add :condition, :string
      add :year, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:cars, [:user_id])
  end
end
