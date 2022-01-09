defmodule ExampleServer.Catalog.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :description, :string
    field :dimensions, :string
    field :name, :string
    field :price, :float
    field :promo_price, :float
    field :weight, :float
    has_many :variants, ExampleServer.Catalog.Product.Variant

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :price, :promo_price, :weight, :dimensions])
    |> validate_required([:name, :description, :price, :promo_price, :weight, :dimensions])
  end
end
