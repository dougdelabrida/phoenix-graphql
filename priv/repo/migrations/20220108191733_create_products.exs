defmodule ExampleServer.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :description, :string
      add :price, :float
      add :promo_price, :float
      add :weight, :float
      add :dimensions, :string

      timestamps()
    end
  end
end
