class Menu < ActiveRecord::Base
    belongs_to :shop
    has_many :drinks_menus
    has_many :drinks, through: :drinks_menus

    def display_my_menu
        puts "=============================================="
        puts "             MY CURRENT MENU"
        puts "=============================================="
        self.drinks_menus.each {|dm| puts "#{dm.drink.name}"}
        puts "=============================================="
    end
end
