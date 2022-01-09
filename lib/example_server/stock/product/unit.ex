defmodule ExampleServer.Stock.Product.Unit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "product_units" do
    field :order_id, :string
    field :sold_price, :float
    belongs_to :variant, ExampleServer.Catalog.Product.Variant

    timestamps()
  end

  @doc false
  def changeset(unit, attrs) do
    unit
    |> cast(attrs, [:order_id, :sold_price])
  end
end
