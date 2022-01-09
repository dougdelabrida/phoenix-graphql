defmodule ExampleServer.Catalog.Product.Variant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "product_variants" do
    field :name, :string
    field :available, :boolean, default: false
    field :sku, :string
    field :type, :string
    field :value, :string
    belongs_to :product, ExampleServer.Catalog.Product
    has_many :units, ExampleServer.Stock.Product.Unit

    timestamps()
  end

  @doc false
  def changeset(variant, attrs) do
    variant
    |> cast(attrs, [:sku, :name, :type, :value, :available])
    |> validate_required([:sku, :name, :type, :value, :available])
  end
end
