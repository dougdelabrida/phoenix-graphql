defmodule ExampleServerWeb.Schema do
  use Absinthe.Schema

  import_types ExampleServerWeb.Schema.DataTypes

  alias ExampleServerWeb.Resolvers

  query do
    @desc "Get list of products"
    field :products, list_of(:product) do
      resolve &Resolvers.Catalog.list_products/3
    end

    @desc "Get variants of a product"
    field :variants, list_of(:variant) do
      resolve &Resolvers.Catalog.list_variants/3
    end

    @desc "Get a variant"
    field :variant, :variant do
      arg :sku, non_null(:string)
      arg :product_id, non_null(:id)
      resolve &Resolvers.Catalog.get_variant/3
    end

    @desc "Get a product"
    field :product, :product do
      arg :id, :id
      resolve &Resolvers.Catalog.get_product/3
    end
  end
end
