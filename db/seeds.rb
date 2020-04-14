
Menu.destroy_all
Drinks.destroy_all
Ingredients.destroy_all
DrinkIngredient.destroy_all
Shop.destroy_all



d1 = Drink.create(name: "brewed coffee")
d2 = Drink.create(name: "cafe latte")
d3 = Drink.create(name: "cafe soy latte")
d4 = Drink.create(name: "cafe machiato")
d5 = Drink.create(name: "cold brew")
d6 = Drink.create(name: "french press")
d7 = Drink.create(name: "espresso shot")
d8 = Drink.create(name: "pour over")
d9 = Drink.create(name: "decaf brewed coffee")
d10 = Drink.create(name: "cubano")
d11 = Drink.create(name: "turkish")
d12 = Drink.create(name: "café bombón")


i1 = Ingredient.create("milk")
i2 = Ingredient.create("espresso")
i3 = Ingredient.create("condensed milk")
i4 = Ingredient.create("sugar")
i5 = Ingredient.create("sweetener")
i6 = Ingredient.create("chocolate flakes")
i7 = Ingredient.create("cinnamon")
i8 = Ingredient.create("honey")
i9 = Ingredient.create("coffee")
i10 = Ingredient.create("soymilk")
i11 = Ingredient.create("matcha")
i12 = Ingredient.create("pumpkin spice")

cafe1 = Shop.create(name: "Super Coffee", address: Faker::Address.street_address)
cafe2 = Shop.create(name: "Hot Coffee", address: Faker::Address.street_address)
cafe3 = Shop.create(name: "Tiger Coffee", address: Faker::Address.street_address)
cafe4 = Shop.create(name: "Drink Moar Coffee", address: Faker::Address.street_address)
cafe5 = Shop.create(name: "Sleepless", address: Faker::Address.street_address)

binding.pry