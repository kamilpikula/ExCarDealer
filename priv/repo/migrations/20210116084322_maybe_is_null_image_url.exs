defmodule ExCarDealer.Repo.Migrations.MaybeIsNullImageUrl do
  use Ecto.Migration

  def change do
    alter table("cars") do
      modify :image_url, :string
    end
  end
end
