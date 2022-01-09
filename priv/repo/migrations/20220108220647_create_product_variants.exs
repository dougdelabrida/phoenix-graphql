defmodule ExampleServer.Repo.Migrations.CreateProductVariants do
  use Ecto.Migration

  def change do
    create table(:product_variants) do
      add :sku, :string
      add :name, :string
      add :type, :string
      add :value, :string
      add :available, :boolean, default: false, null: false
      add :product_id, references(:products, on_delete: :nothing)

      timestamps()
    end

    create index(:product_variants, [:product_id])
  end
end
