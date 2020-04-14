

Menu.destroy_all
Drink.destroy_all
Ingredient.destroy_all
DrinkIngredient.destroy_all
Shop.destroy_all

# =============================Ingredient seeds=============================
i1 = Ingredient.create(name: "milk")
i2 = Ingredient.create(name: "espresso")
i3 = Ingredient.create(name: "sweetened condensed milk")
i4 = Ingredient.create(name: "sugar")
i5 = Ingredient.create(name: "sweetener")
i6 = Ingredient.create(name: "chocolate flakes")
i7 = Ingredient.create(name: "cinnamon")
i8 = Ingredient.create(name: "honey")
i9 = Ingredient.create(name: "coffee")
i10 = Ingredient.create(name: "soymilk")
i11 = Ingredient.create(name: "matcha")
i12 = Ingredient.create(name: "pumpkin spice")
i13 = Ingredient.create(name: "decaf coffee")
i14 = Ingredient.create(name: "ground cardamom")

# =============================Shop seeds=============================
cafe1 = Shop.create(name: "Super Coffee", address: Faker::Address.street_address)
cafe2 = Shop.create(name: "Hot Coffee", address: Faker::Address.street_address)
cafe3 = Shop.create(name: "Tiger Coffee", address: Faker::Address.street_address)
cafe4 = Shop.create(name: "Drink Moar Coffee", address: Faker::Address.street_address)
cafe5 = Shop.create(name: "Awful Coffee", address: Faker::Address.street_address)

# =============================Drink seeds=============================
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

# =============================Menu seeds=============================

cafe1.menu = Menu.create()
cafe2.menu = Menu.create()
cafe3.menu = Menu.create()
cafe4.menu = Menu.create()
cafe5.menu = Menu.create()


cafe1.menu.drinks = Drink.all
binding.pry 
cafe2.menu.drinks = Drink.all
cafe3.menu.drinks = Drink.all
cafe4.menu.drinks = Drink.all
cafe5.menu.drinks = Drink.all

# ===========================Drink Ing seeds=============================
d1.ingredients << i9
d2.ingredients << [i1, i2]
d3.ingredients << [i10, i12]
d4.ingredients << [i1, i12, i6]
d5.ingredients << i9
d6.ingredients << i9
d7.ingredients << i9
d8.ingredients << i9
d9.ingredients << i12
d10.ingredients << [i2, i4]
d11.ingredients << [i9, i14]
d12.ingredients << [i9, i3]

# =============================Menu drink seeds=============================

# Menu.first.drinks = Drink.all
# # binding.pry
# Menu.second.drinks = Drink.all
# Menu.third.drinks = Drink.all
# Menu.fourth.drinks = Drink.all
# Menu.fifth.drinks = Drink.all