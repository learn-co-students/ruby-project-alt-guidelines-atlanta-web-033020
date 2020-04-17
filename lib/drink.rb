class Drink < ActiveRecord::Base
    has_many :drink_ingredients
    has_many :ingredients, through: :drink_ingredients
    has_many :drinks_menus
    has_many :menus, through: :drinks_menus

    def self.display_all_drinks
        binding.pry
        Drink.all.each_with_index do |val, index|
            binding.pry
            puts "#{index + 1}. #{val.name} --> Drink ID (#{val.id})"
        end
    end

    def invent_new_drink
        prompt = TTY::Prompt.new
        set_name
        set_price
        @ingredients = []
        until @choice == "EXIT menu" do
            unused_ingredients = Ingredient.all - self.ingredients
            menu_list = unused_ingredients.map {|i| i.name}
            prompt_for_ingredients
            @choice = prompt.select("Use arrows & ENTER to select:", menu_list.unshift("EXIT menu"))
            @ingredients << Ingredient.find_by(name: @choice)
        
        end
        puts "=============================================="
        @ingredients.pop
        @ingredients.each do |i|
            puts "#{i.name} was added to drink"
            end
        puts "=============================================="
        create_drink_if_valid
    end

    def create_drink_if_valid
        if @ingredients.any?
            self.name = @name
            self.price = @price
            self.ingredients << @ingredients
            self.save
        else
            puts "=============================================="
            puts "An item needs at least one ingredient."
            puts "No new item was created."
            puts "=============================================="
        end
    end

    def show_selected_ingredients
        @ingredients.each do |ingredient|
        puts "#{ingredient.id} <<<  #{ingredient.name}"
        end
    end

    def show_all_ingredients
        Ingredient.display_all_ingredients
    end

    def show_all_missing_ingredients
        list = Ingredient.all - self.ingredients
        menu_list = list.map {|l| l.name }
        menu_list
    end

    def set_price
        prompt_for_price
        drink_price = gets.chomp
        @price = drink_price.to_f
    end

    def set_name
        prompt_for_name
        @name = gets.chomp
    end
    
    def prompt_for_name
        puts "=============================================="    
        puts "Create new menu item"
        puts "Enter the NAME of this item below."
        puts "=============================================="
    end

    def prompt_for_price
        puts "=============================================="    
        puts "Enter the PRICE of this item below."
        puts "=============================================="
    end
    
    # def prompt_for_ingredient_to_add
    #     show_selected_ingredients
    #     puts "=============================================="
    #     puts "      Select additional ingredients."
    #     puts "=============================================="
    # end

    def prompt_for_ingredients
        puts "=============================================="
        puts "  Select INGREDIENTS to add to this item: "
        puts "=============================================="
    end

end