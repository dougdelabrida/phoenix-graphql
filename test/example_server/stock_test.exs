defmodule ExampleServer.StockTest do
  use ExampleServer.DataCase

  alias ExampleServer.Stock

  describe "product_units" do
    alias ExampleServer.Stock.Product.Unit

    import ExampleServer.StockFixtures

    @invalid_attrs %{order_id: nil, sold_price: nil}

    test "list_product_units/0 returns all product_units" do
      unit = unit_fixture()
      assert Stock.list_product_units() == [unit]
    end

    test "get_unit!/1 returns the unit with given id" do
      unit = unit_fixture()
      assert Stock.get_unit!(unit.id) == unit
    end

    test "create_unit/1 with valid data creates a unit" do
      valid_attrs = %{order_id: "some  order_id", sold_price: 120.5}

      assert {:ok, %Unit{} = unit} = Stock.create_unit(valid_attrs)
      assert unit. order_id == "some  order_id"
      assert unit.sold_price == 120.5
    end

    test "create_unit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stock.create_unit(@invalid_attrs)
    end

    test "update_unit/2 with valid data updates the unit" do
      unit = unit_fixture()
      update_attrs = %{order_id: "some updated  order_id", sold_price: 456.7}

      assert {:ok, %Unit{} = unit} = Stock.update_unit(unit, update_attrs)
      assert unit. order_id == "some updated  order_id"
      assert unit.sold_price == 456.7
    end

    test "update_unit/2 with invalid data returns error changeset" do
      unit = unit_fixture()
      assert {:error, %Ecto.Changeset{}} = Stock.update_unit(unit, @invalid_attrs)
      assert unit == Stock.get_unit!(unit.id)
    end

    test "delete_unit/1 deletes the unit" do
      unit = unit_fixture()
      assert {:ok, %Unit{}} = Stock.delete_unit(unit)
      assert_raise Ecto.NoResultsError, fn -> Stock.get_unit!(unit.id) end
    end

    test "change_unit/1 returns a unit changeset" do
      unit = unit_fixture()
      assert %Ecto.Changeset{} = Stock.change_unit(unit)
    end
  end
end
