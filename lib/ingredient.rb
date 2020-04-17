class Ingredient < ActiveRecord::Base
    has_many :drink_ingredients
    has_many :drinks, through: :drink_ingredients

    def add_ingredient
        font = TTY::Font.new(:standard)
        pastel = Pastel.new
        Ingredient.display_all_ingredients
        prompt_for_name
        @name = gets.chomp.downcase
        if !Ingredient.find_by(name: @name)
            self.name = @name
            self.save
            puts pastel.red("===================================================")
            puts pastel.yellow("        Ingredient added to list")
            puts pastel.red("===================================================")
        else
            puts pastel.red("===================================================")
            puts pastel.yellow(" !!This item exists already in the system!!")
            puts pastel.red("===================================================")
        end
    end

    def self.display_all_ingredients
        font = TTY::Font.new(:standard)
        pastel = Pastel.new
        puts pastel.red("===================================================")
        puts pastel.yellow("          >>>>>ALL INGREDIENTS<<<<<")
        puts pastel.red("===================================================")
        Ingredient.all.each do |i|
            puts pastel.yellow("==>  #{i.name}")
        end
    end

    def set_name
        show_all_ingredients
        prompt_for_name
        input = gets.chomp
        @name = input.downcase
    end
    
    def prompt_for_name
        font = TTY::Font.new(:standard)
        pastel = Pastel.new
        puts pastel.red("===================================================")
        puts pastel.yellow("  ^^ Existing ingredients listed above ^^")
        puts pastel.red("===================================================")
        puts pastel.yellow("    To ADD new ingredient to list:")
        puts pastel.yellow("  -Enter the NAME below")
        puts pastel.yellow("  -Type DONE to exit")
        puts pastel.red("===================================================")
    end
end