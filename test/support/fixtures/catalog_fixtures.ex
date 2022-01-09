defmodule ExampleServer.CatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ExampleServer.Catalog` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        description: "some description",
        dimensions: "some dimensions",
        name: "some name",
        price: 42,
        promoPrice: 42,
        weight: 42
      })
      |> ExampleServer.Catalog.create_product()

    product
  end

  @doc """
  Generate a variant.
  """
  def variant_fixture(attrs \\ %{}) do
    {:ok, variant} =
      attrs
      |> Enum.into(%{
         name: "some  name",
        available: true,
        sku: "some sku",
        type: "some type",
        value: "some value"
      })
      |> ExampleServer.Catalog.create_variant()

    variant
  end
end
