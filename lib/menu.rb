class Menu < ActiveRecord::Base
    belongs_to :shop
    has_many :drinks_menus
    has_many :drinks, through: :drinks_menus

    def display_my_menu
        puts "=============================================="
        puts "MY CURRENT MENU OF DRINKS"
        puts "=============================================="
        self.drinks.each_with_index do |val, index|
            puts "#{index + 1}. #{val.name}"
        end
        puts "=============================================="
        puts "=============================================="
    end
    
    def add_drink_to_menu(cafe)
        # binding.pry
        Drink.display_all
        puts "=============================================="
        puts "What would you like to do? Pick one:" 
        puts "1. Add one of these drinks"
        puts "2. Type CREATE to add your drink to this list"
        puts "3. Go back to main menu"
        puts "4. Quit"
        puts "=============================================="
        choice = gets.chomp
        case choice
        when "1"
            puts "Enter DRINK ID (find ID number above)"
            puts "=============================================="
            drink_id_to_add = gets.chomp
            if Drink.all.map {|d| d.id}.include? drink_id_to_add
                drink_to_add = Drink.find drink_id_to_add
                # shop = Shop.find cafe_id
                cafe.menu.drinks << drink_to_add

            else
                puts "Error: Drink ID invalid. Please try again."
                add_drink_to_menu(cafe)
            end
        when "2"
        when "3"
            
        when "4"
            exit
        else
            puts "Error: Drink ID invalid. Please try again."
            add_drink_to_menu(cafe)
        end
    end

    # def search_menu
    # end

end
