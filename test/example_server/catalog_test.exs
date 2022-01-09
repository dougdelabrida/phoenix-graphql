defmodule ExampleServer.CatalogTest do
  use ExampleServer.DataCase

  alias ExampleServer.Catalog

  describe "products" do
    alias ExampleServer.Catalog.Product

    import ExampleServer.CatalogFixtures

    @invalid_attrs %{description: nil, dimensions: nil, name: nil, price: nil, promoPrice: nil, weight: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Catalog.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Catalog.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{description: "some description", dimensions: "some dimensions", name: "some name", price: 42, promoPrice: 42, weight: 42}

      assert {:ok, %Product{} = product} = Catalog.create_product(valid_attrs)
      assert product.description == "some description"
      assert product.dimensions == "some dimensions"
      assert product.name == "some name"
      assert product.price == 42
      assert product.promoPrice == 42
      assert product.weight == 42
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{description: "some updated description", dimensions: "some updated dimensions", name: "some updated name", price: 43, promoPrice: 43, weight: 43}

      assert {:ok, %Product{} = product} = Catalog.update_product(product, update_attrs)
      assert product.description == "some updated description"
      assert product.dimensions == "some updated dimensions"
      assert product.name == "some updated name"
      assert product.price == 43
      assert product.promoPrice == 43
      assert product.weight == 43
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_product(product, @invalid_attrs)
      assert product == Catalog.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Catalog.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Catalog.change_product(product)
    end
  end

  describe "product_variants" do
    alias ExampleServer.Catalog.Product.Variant

    import ExampleServer.CatalogFixtures

    @invalid_attrs %{name: nil, available: nil, sku: nil, type: nil, value: nil}

    test "list_product_variants/0 returns all product_variants" do
      variant = variant_fixture()
      assert Catalog.list_product_variants() == [variant]
    end

    test "get_variant!/1 returns the variant with given id" do
      variant = variant_fixture()
      assert Catalog.get_variant!(variant.id) == variant
    end

    test "create_variant/1 with valid data creates a variant" do
      valid_attrs = %{name: "some  name", available: true, sku: "some sku", type: "some type", value: "some value"}

      assert {:ok, %Variant{} = variant} = Catalog.create_variant(valid_attrs)
      assert variant. name == "some  name"
      assert variant.available == true
      assert variant.sku == "some sku"
      assert variant.type == "some type"
      assert variant.value == "some value"
    end

    test "create_variant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_variant(@invalid_attrs)
    end

    test "update_variant/2 with valid data updates the variant" do
      variant = variant_fixture()
      update_attrs = %{name: "some updated  name", available: false, sku: "some updated sku", type: "some updated type", value: "some updated value"}

      assert {:ok, %Variant{} = variant} = Catalog.update_variant(variant, update_attrs)
      assert variant. name == "some updated  name"
      assert variant.available == false
      assert variant.sku == "some updated sku"
      assert variant.type == "some updated type"
      assert variant.value == "some updated value"
    end

    test "update_variant/2 with invalid data returns error changeset" do
      variant = variant_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_variant(variant, @invalid_attrs)
      assert variant == Catalog.get_variant!(variant.id)
    end

    test "delete_variant/1 deletes the variant" do
      variant = variant_fixture()
      assert {:ok, %Variant{}} = Catalog.delete_variant(variant)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_variant!(variant.id) end
    end

    test "change_variant/1 returns a variant changeset" do
      variant = variant_fixture()
      assert %Ecto.Changeset{} = Catalog.change_variant(variant)
    end
  end
end
