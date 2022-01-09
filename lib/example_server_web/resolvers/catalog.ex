defmodule ExampleServerWeb.Resolvers.Catalog do
  def get_product(%ExampleServer.Catalog.Product.Variant{} = variant, args, _resolution) do
    {:ok, ExampleServer.Catalog.get_product!(variant.id)}
  end

  def get_product(_parent, args, _resolution) do
    {:ok, ExampleServer.Catalog.get_product!(args[:id])}
  end

  def list_products(_parent, _args, _resolution) do
    {:ok, ExampleServer.Catalog.list_products()}
  end

  def list_variants(%ExampleServer.Catalog.Product{} = product, _args, _resolution) do
    {:ok, ExampleServer.Catalog.list_product_variants(product)}
  end

  def list_variants(_parent, _args, _resolution) do
    {:ok, ExampleServer.Catalog.list_product_variants()}
  end

  def get_variant(_parent, args = %{product_id: product_id, sku: sku}, _resolution) do
    {:ok, ExampleServer.Catalog.get_variant!(product_id, sku)}
  end

  def get_variant(%ExampleServer.Catalog.Product{} = product, args = %{sku: sku}, _resolution) do
    {:ok, ExampleServer.Catalog.get_variant!(product, sku)}
  end
end
