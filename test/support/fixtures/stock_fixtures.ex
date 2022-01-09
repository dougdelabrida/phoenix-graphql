defmodule ExampleServer.StockFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ExampleServer.Stock` context.
  """

  @doc """
  Generate a unit.
  """
  def unit_fixture(attrs \\ %{}) do
    {:ok, unit} =
      attrs
      |> Enum.into(%{
         order_id: "some  order_id",
        sold_price: 120.5
      })
      |> ExampleServer.Stock.create_unit()

    unit
  end
end
