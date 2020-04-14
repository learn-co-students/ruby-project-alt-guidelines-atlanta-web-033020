class Menu < ActiveRecord::Base
    belongs_to :shop
    has_many :drinks_menus
    has_many :drinks, through: :drinks_menus

    def display
        binding.pry
        self.drinks.each_with_index do |val, index|
            puts "#{index}. #{val}"
        end
    end

    # def search_menu
    # end

end
