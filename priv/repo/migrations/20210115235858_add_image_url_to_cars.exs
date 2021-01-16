defmodule ExCarDealer.Repo.Migrations.AddImageUrlToCars do
  use Ecto.Migration

  def change do
    alter table("cars") do
      add :image_url, :string
    end
  end
end
