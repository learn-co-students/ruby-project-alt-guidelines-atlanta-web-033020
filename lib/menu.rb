class Menu < ActiveRecord::Base
    belongs_to :shop
    has_many :drinks

    def display
        binding.pry
        self.drinks.each_with_index do |val, index|
            puts "#{index}. #{val}"
        end
    end

end
