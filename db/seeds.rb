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
i5 = Ingredient.create(name: "seetener")
i6 = Ingredient.create(name: "chocolate flakes")
i7 = Ingredient.create(name: "cinnamon")
i8 = Ingredient.create(name: "honey")
i9 = Ingredient.create(name: "coffee")
i10 = Ingredient.create(name: "soymilk")
i11 = Ingredient.create(name: "matcha")
i12 = Ingredient.create(name: "pumpkin spice")
i13 = Ingredient.create(name: "decaf coffee")
i14 = Ingredient.create(name: "ground cardamom")
i15 = Ingredient.create(name: "chai")
i16 = Ingredient.create(name: "hot chocolate")
i17 = Ingredient.create(name: "whipped cream")
i18 = Ingredient.create(name: "splenda")
i19 = Ingredient.create(name: "stevia")
i20 = Ingredient.create(name: "agave nectar")

# =============================Shop seeds=============================
cafe1 = Shop.create(name: "Tiger Coffee", address: Faker::Address.street_address)
cafe2 = Shop.create(name: "Insert Clever Name Here Coffee", address: Faker::Address.street_address)
cafe3 = Shop.create(name: "Princeton's Backstreet Coffee", address: Faker::Address.street_address)
cafe4 = Shop.create(name: "Drink Moar Coffee", address: Faker::Address.street_address)
cafe5 = Shop.create(name: "My God, What is it? Coffee", address: Faker::Address.street_address)

# =============================Drink seeds=============================
d1 = Drink.create(name: "brewed coffee")
d2 = Drink.create(name: "caffe latte")
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
d13 = Drink.create(name: "affogato")
d14 = Drink.create(name: "americano")
d15 = Drink.create(name: "café au lait")
d16 = Drink.create(name: "cappuccino")
d17 = Drink.create(name: "double espresso (doppio)")
d18 = Drink.create(name: "iced latte")
d19 = Drink.create(name: "irish coffee")
d20 = Drink.create(name: "flat white")

# =============================Menu seeds=============================

m1 = Menu.create(shop_id: cafe1.id)
m2 = Menu.create(shop_id: cafe2.id)
m3 = Menu.create(shop_id: cafe3.id)
m4 = Menu.create(shop_id: cafe4.id)
m5 = Menu.create(shop_id: cafe5.id)

20.times do
    a = DrinksMenu.create(menu_id: Shop.all.sample.menu.id, drink_id: Drink.all.sample.id)
    if a.valid?
        a.save!
    end
end
#
#Menu.all.sample.id
#Shop.all.sample.menu.id
# ===========================Drink Ing seeds=============================

20.times do
    a = DrinkIngredient.create(drink_id: Drink.all.sample.id, ingredient_id: Ingredient.all.sample.id)
    a.save!
end