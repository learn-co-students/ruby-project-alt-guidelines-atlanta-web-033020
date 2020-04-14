class Drink < ActiveRecord::Base
    has_many :drink_ingredients
    has_many :ingredients, through: :drink_ingredients
    has_many :drinks_menus
    has_many :menus, through: :drinks_menus

    def self.display_all
        Drink.all.each_with_index do |val, index|
            puts "#{index + 1}. #{val.name} --> Drink ID (#{val.id})"
        end
    end

    # def self.all
    #     binding.pry
    #     Drink.all.each do |d|
    #         ary << d.id
    #     end
    # end

    def invent_new_drink(name:, price:)
        new_drink = Drink.new()
        new_drink.name = name
        new_drink.price = price
        new_drink
    end

end