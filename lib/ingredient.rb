class Ingredient < ActiveRecord::Base
    has_many :drink_ingredients
    has_many :drinks, through: :drink_ingredients

    def self.display_all_ingredients
        Ingredient.all.each do |i|
            puts "Ingredient ID >>>(#{i.id})<<<  #{i.name}"
        end
        puts "=============================================="
    end
end