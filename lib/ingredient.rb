class Ingredient < ActiveRecord::Base
    has_many :drink_ingredients
    has_many :drinks, through: :drink_ingredients

    def add_ingredient
        set_name
        create_ingredient
    end

    def self.display_all_ingredients
        Ingredient.all.each do |i|
            puts "Ingredient ID >>>(#{i.id})<<<  #{i.name}"
        end
        puts "=============================================="
    end

    private

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
        puts "Enter the NAME below. Type DONE to exit"
        puts "=============================================="
    end
    
    def self.id_exists?(id)
        self.find_by(id: id.to_i)
    end

    def self.name_exists?(name)
        self.find_by(name: name.downcase.capitalize)
    end
    
    def show_all_ingredients
        Ingredient.display_all_ingredients
    end
    
    # def self.add_new_ingredient
    #     i = Ingredient.new
    #     puts "========================================================="
    #     puts "What is the name of the ingredient you would like to add?"
    #     puts "Enter the name below. Type Q to quit."
    #     puts "========================================================="
    #     ing_name = gets.chomp
    #     if self.name_exists?(ing_name)
    #         puts "========================================================="
    #         puts "That ingredient already exists in the system"
    #         puts "========================================================="
    #     else
    #         i.name = ing_name.downcase.capitalize
    #         i.save
    #         puts "========================================================="
    #         puts "Ingredient added to list"
    #         puts "========================================================="
    #         return i
    #     end
    # end
end