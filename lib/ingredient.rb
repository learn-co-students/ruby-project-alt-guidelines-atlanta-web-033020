class Ingredient < ActiveRecord::Base
    has_many :drink_ingredients
    has_many :drinks, through: :drink_ingredients

    def self.id_exists?(id)
        self.find_by(id: id.to_i)
    end

    def self.name_exists?(name)
        self.find_by(name: name.downcase.capitalize)
    end
    
    def self.display_all_ingredients
        Ingredient.all.each do |i|
            puts "Ingredient ID >>>(#{i.id})<<<  #{i.name}"
        end
        puts "=============================================="
    end

    def self.add_new_ingredient
        i = Ingredient.new
        puts "========================================================="
        puts "What is the name of the ingredient you would like to add?"
        puts "Enter the name below. Type Q to quit."
        puts "========================================================="
        ing_name = gets.chomp
        if self.name_exists?(ing_name)
            puts "========================================================="
            puts "That ingredient already exists in the system"
            puts "========================================================="
        else
            i.name = ing_name.downcase.capitalize
            i.save
            puts "========================================================="
            puts "Ingredient added to list"
            puts "========================================================="
            return i
        end
    end
end