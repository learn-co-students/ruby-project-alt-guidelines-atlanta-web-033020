class Menu < ActiveRecord::Base
    belongs_to :shop
    has_many :drinks_menus
    has_many :drinks, through: :drinks_menus

    def display_my_menu
        prompt = TTY::Prompt.new(active_color: :yellow)
        font = TTY::Font.new(:standard)
        pastel = Pastel.new
        puts pastel.red("===================================================")
        puts pastel.yellow("             MY CURRENT MENU")
        puts pastel.red("===================================================")
        puts pastel.yellow("         Item ==>> Ingredients")
        puts pastel.red("         ----------------------")
        self.drinks.each do |drink|
            list_of_ingredients = drink.ingredients.collect {|i| i.name}.join(", ")
            puts pastel.yellow("#{drink.name}")
            puts pastel.red("    ==>> #{list_of_ingredients}")
        end
        puts pastel.red("===================================================")
    end
end
