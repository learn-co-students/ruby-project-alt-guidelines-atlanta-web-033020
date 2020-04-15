class Drink < ActiveRecord::Base
    has_many :drink_ingredients
    has_many :ingredients, through: :drink_ingredients
    has_many :drinks_menus
    has_many :menus, through: :drinks_menus

    def self.create_drink
        # TODO: how can I force the cafe owner to input ingredients?
        # Does owner need to be stepped through it?
        puts "=============================================="    
        puts "Create new menu item"
        puts "Enter the NAME of this item below."
        puts "=============================================="
        @name = gets.chomp
        puts "=============================================="    
        puts "Enter the PRICE of this item below."
        puts "=============================================="
        price = gets.chomp
        @price = price.to_f
        drink = Drink.new(name: @name, price: @price)
        puts "=============================================="
        puts "What INGREDIENTS does this item have?"
        puts "=============================================="
        puts "Enter ID from list below **OR**"
        puts "enter '0' to add a new ingredient."
        puts "=============================================="
        binding.pry
        #display_ingredients
        Ingredient.display_all_ingredients

    end
    
    def self.display_all_drinks
        Drink.all.each_with_index do |val, index|
            puts "#{index + 1}. #{val.name} --> Drink ID (#{val.id})"
        end
    end

    def invent_new_drink(name:, price:)
        new_drink = Drink.new()
        new_drink.name = name
        new_drink.price = price
        new_drink
    end

    def self.edit_drink_ingredients(cafe)
        cafe.menu.display_my_menu
        puts "=============================================="    
        puts "Which item would you like to edit?"
        puts "Input the ID and press enter"
        puts "=============================================="
        item = gets.chomp
        # TODO have to come up with a way to add ingredients to a drink before this

    end

end