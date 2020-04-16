class Ingredient < ActiveRecord::Base
    has_many :drink_ingredients
    has_many :drinks, through: :drink_ingredients

    def add_ingredient
        Ingredient.display_all_ingredients
        prompt_for_name
        @name = gets.chomp.downcase
        if !Ingredient.find_by(name: @name)
            Ingredient.create(name: @name)
            puts "=============================================="
            puts "        Ingredient added to list"
            puts "=============================================="
        else
            puts "=============================================="
            puts " !!This item exists already in the system!!"
            puts "=============================================="
        end
    end

    def self.display_all_ingredients
        Ingredient.all.each do |i|
            puts "Ingredient ID >>>(#{i.id})<<<  #{i.name}"
        end
        puts "=============================================="
    end

    def set_name
        show_all_ingredients
        prompt_for_name
        input = gets.chomp
        @name = input.downcase
    end
    
    def create_ingredient
        if !Ingredient.find_by(name: @name)
            Ingredient.create(name: @name)
            puts "=============================================="
            puts "Ingredient added to list"
            puts "=============================================="
        else
            puts "=============================================="
            puts "This item exists already in the system."
            puts "=============================================="
        end
    end

    def prompt_for_name
        puts "=============================================="    
        puts "Add new ingredient to list"
        puts "Existing ingredients listed above"
        puts "Enter the NAME below. Type DONE to exit"
        puts "=============================================="
    end
end