class Drink < ActiveRecord::Base
    has_many :drink_ingredients
    has_many :ingredients, through: :drink_ingredients
    has_many :drinks_menus
    has_many :menus, through: :drinks_menus


    def invent_new_drink
        prompt = TTY::Prompt.new(active_color: :yellow)
        font = TTY::Font.new(:standard)
        pastel = Pastel.new
        set_name
        set_price
        @ingredients = []
        until @choice == "EXIT menu" do
            unused_ingredients = Ingredient.all - self.ingredients
            menu_list = unused_ingredients.collect {|i| i.name}
            prompt_for_ingredients
            @choice = prompt.select("Use arrows & ENTER to select:", menu_list.unshift("EXIT menu"))
            @ingredients << Ingredient.find_by(name: @choice)
        end
        @ingredients.pop #removes nil that gets shoved on after EXIT menu selected
        @ingredients.each do |i|
            puts pastel.yellow("#{i.name} was added to drink")
            end
        create_drink_if_valid
    end

    def create_drink_if_valid
        prompt = TTY::Prompt.new(active_color: :yellow)
        font = TTY::Font.new(:standard)
        pastel = Pastel.new
        if @ingredients.any?
            self.name = @name
            self.price = @price
            self.ingredients << @ingredients
            self.save
            return self
        else
            puts pastel.red("===================================================")
            puts pastel.yellow("An item needs at least one ingredient.")
            puts pastel.yellow("No new item was created.")
            puts pastel.red("===================================================")
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
        font = TTY::Font.new(:standard)
        pastel = Pastel.new
        puts pastel.red("===================================================")
        puts pastel.yellow("Create new menu item")
        puts pastel.yellow("Enter the NAME of this item below.")
        puts pastel.red("===================================================")
    end

    def prompt_for_price
        font = TTY::Font.new(:standard)
        pastel = Pastel.new
        puts pastel.red("===================================================")
        puts pastel.yellow("Enter the PRICE of this item below.")
        puts pastel.red("===================================================")
    end
    
    def prompt_for_ingredients
        font = TTY::Font.new(:standard)
        pastel = Pastel.new
        puts pastel.red("===================================================")
        puts pastel.yellow("  Select INGREDIENTS to add to this item: ")
        puts pastel.red("===================================================")
    end

    # def self.display_all_drinks
    #     Drink.all.each_with_index do |val, index|
    #         binding.pry
    #         puts "#{index + 1}. #{val.name} --> Drink ID (#{val.id})"
    #     end
    # end

end