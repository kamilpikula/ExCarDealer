defmodule ExCarDealer.Repo.Migrations.ChangeTypeOfPriceField do
  use Ecto.Migration

  def change do
    alter table("cars") do
      modify :price, :integer
    end
  end
end
