# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ExampleServer.Repo.insert!(%ExampleServer.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# insert some products

ExampleServer.Repo.insert! %ExampleServer.Catalog.Product{
  description: "Uma descrição qualquer",
  dimensions: "0.5x0.5x0.5",
  name: "Um nome qualquer",
  price: 3.99,
  promo_price: 1.99,
  weight: 0.5,
  variants: [
    %ExampleServer.Catalog.Product.Variant{
      name: "vermelho",
      available: true,
      sku: "ITEM1-VERMELHO",
      type: "COLOR",
      value: "RED",
      units: [
        %ExampleServer.Stock.Product.Unit{},
        %ExampleServer.Stock.Product.Unit{},
        %ExampleServer.Stock.Product.Unit{},
      ]
    },
    %ExampleServer.Catalog.Product.Variant{
      name: "azul",
      available: false,
      sku: "ITEM1-AZUL",
      type: "COLOR",
      value: "BLUE"
    },
  ]
}

ExampleServer.Repo.insert! %ExampleServer.Catalog.Product{
  description: "Uma descrição qualquer 2",
  dimensions: "0.5x0.5x0.5",
  name: "Um produto qualquer",
  price: 4.99,
  promo_price: 2.99,
  weight: 0.5,
  variants: [
    %ExampleServer.Catalog.Product.Variant{
      name: "Pequeno",
      available: true,
      sku: "ITEM2-SMALL",
      type: "SIZE",
      value: "small"
    },
    %ExampleServer.Catalog.Product.Variant{
      name: "Grande",
      available: true,
      sku: "ITEM2-LARGE",
      type: "SIZE",
      value: "large",
      units: [
        %ExampleServer.Stock.Product.Unit{},
        %ExampleServer.Stock.Product.Unit{},
        %ExampleServer.Stock.Product.Unit{}
      ]
    },
  ]
}
