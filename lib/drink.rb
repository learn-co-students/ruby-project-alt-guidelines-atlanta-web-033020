class Drink < ActiveRecord::Base
    has_many :drink_ingredients
    has_many :ingredients, through: :drink_ingredients
    has_many :drinks_menus
    has_many :menus, through: :drinks_menus

    def create_drink
        # TODO: how can I force the cafe owner to input ingredients?
        # binding.pry
        puts "=============================================="    
        puts "Create new menu item"
        puts "Enter the NAME of this item below."
        puts "=============================================="
        self.name = gets.chomp
        puts "=============================================="    
        puts "Enter the PRICE of this item below."
        puts "=============================================="
        drink_price = gets.chomp
        self.price = drink_price.to_f
        puts "=============================================="
        puts "What INGREDIENTS does this item have?"
        puts "=============================================="
        puts "Enter ID from list below **OR**"
        puts "enter '0' to add a new ingredient."
        puts "type DONE when finished."
        puts "=============================================="
        #display all ingredient options
        Ingredient.display_all_ingredients
        ingredient_choice = gets.chomp
        # binding.pry
        if Ingredient.id_exists?(ingredient_choice)
            self.ingredients << ingredient_choice
        elsif ingredient_choice = "0" # meaning create a new ingredient option
            new_ingredient = Drink.add_new_ingredient
            new_ingredient.save
                
            puts "=============================================="
            puts "Ingredient added to item"
            puts "=============================================="
        elsif ingredient_choice = "DONE"
        else
            puts "=============================================="
            puts "Invalid entry. Please try again."
            puts "=============================================="
        end
    end
    
    def self.display_all_drinks
        Drink.all.each_with_index do |val, index|
            puts "#{index + 1}. #{val.name} --> Drink ID (#{val.id})"
        end
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