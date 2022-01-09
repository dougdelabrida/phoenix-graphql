defmodule ExampleServerWeb.Schema.DataTypes do
  use Absinthe.Schema.Notation

  alias ExampleServerWeb.Resolvers

  object :product do
    field :id, :id
    field :description, :string
    field :dimensions, :string
    field :name, :string
    field :price, :float
    field :promo_price, :float
    field :weight, :float
    field :variant, :variant do
      arg :sku, non_null(:string)
      resolve &Resolvers.Catalog.get_variant/3
    end
    field :variants, list_of(:variant) do
      resolve &Resolvers.Catalog.list_variants/3
    end
  end

  object :variant do
    field :product, :product do
      arg :product_id, :string
      resolve &Resolvers.Catalog.get_product/3
    end
    field :name, :string
    field :available, :boolean
    field :sku, :string
    field :type, :string
    field :value, :string
  end
end
