defmodule ExampleServer.Repo.Migrations.CreateProductUnits do
  use Ecto.Migration

  def change do
    create table(:product_units) do
      add :order_id, :string
      add :sold_price, :float
      add :variant_id, references(:product_variants, on_delete: :nothing)

      timestamps()
    end

    create index(:product_units, [:variant_id])
  end
end
