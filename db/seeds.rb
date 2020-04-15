Menu.destroy_all
DrinksMenu.destroy_all
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

m1 = Menu.new(shop_id: cafe1.id)
m2 = Menu.new(shop_id: cafe2.id)
m3 = Menu.new(shop_id: cafe3.id)
m4 = Menu.new(shop_id: cafe4.id)
m5 = Menu.new(shop_id: cafe5.id)


20.times do
    a = DrinksMenu.new(menu_id: Shop.all.sample.menu.id, drink_id: Drink.all.sample.id)
    if a.valid?
        a.save!
    end
end

# ===========================Drink Ing seeds=============================

20.times do
    a = DrinkIngredient.new(drink_id: Drink.all.sample.id, ingredient_id: Ingredient.all.sample.id)
    a.save!
end

# d1.ingredients << i9
# d2.ingredients << [i1, i2]
# d3.ingredients << [i10, i12]
# d4.ingredients << [i1, i12, i6]
# d5.ingredients << i9
# d6.ingredients << i9
# d7.ingredients << i9
# d8.ingredients << i9
# d9.ingredients << i12
# d10.ingredients << [i2, i4]
# d11.ingredients << [i9, i14]
# d12.ingredients << [i9, i3]
