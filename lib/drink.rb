class Drink < ActiveRecord::Base
    has_many :drink_ingredients
    has_many :ingredients, through: :drink_ingredients
    has_many :drinks_menus
    has_many :menus, through: :drinks_menus

    def initialize(:name, :)

    end
    
    def self.display_all
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