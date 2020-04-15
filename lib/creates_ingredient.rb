class CreatesIngredient

    def run
        set_name
        add_ingredient
    end

    def set_name
        show_all_ingredients
        prompt_for_name
        input = gets.chomp
        @name = input.downcase
    end
    
    def add_ingredient
        if !Ingredient.name_exists?(@name)
            Ingredient.create(name: @name).reload
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
        puts "Enter the NAME below. Type DONE to exit"
        puts "=============================================="
    end

    def show_all_ingredients
        Ingredient.display_all_ingredients
      end
end