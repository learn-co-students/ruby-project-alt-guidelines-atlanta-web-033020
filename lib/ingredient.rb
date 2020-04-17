class Ingredient < ActiveRecord::Base
    has_many :drink_ingredients
    has_many :drinks, through: :drink_ingredients

    def add_ingredient
        Ingredient.display_all_ingredients
        prompt_for_name
        @name = gets.chomp.downcase
        if !Ingredient.find_by(name: @name)
            self.name = @name
            self.save
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
        puts "=============================================="
        puts "          >>>>>ALL INGREDIENTS<<<<<"
        puts "=============================================="
        Ingredient.all.each do |i|
            puts "==>  #{i.name}"
        end
    end

    def set_name
        show_all_ingredients
        prompt_for_name
        input = gets.chomp
        @name = input.downcase
    end
    
    def prompt_for_name
        puts "=============================================="    
        puts "  ^^ Existing ingredients listed above ^^"
        puts "=============================================="   
        puts "    To ADD new ingredient to list:"
        puts "  -Enter the NAME below"
        puts "  -Type DONE to exit"
        puts "=============================================="
    end
end