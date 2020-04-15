class Menu < ActiveRecord::Base
    belongs_to :shop
    has_many :drinks_menus
    has_many :drinks, through: :drinks_menus

    def display_my_menu
        puts "=============================================="
        puts "MY CURRENT MENU"
        puts "=============================================="
        self.drinks.each_with_index do |drink, index|
            puts "Drink ID ===>>(#{drink.id})<<=== #{drink.name}"
            # puts "#{drink.name} --> Drink ID (#{drink.id})"
            # |drink, index| are here in case we want a numbered list but that may confuse user and yield index input rather than drink_id
        end
        puts "=============================================="
    end
    
    def add_drink_to_menu(cafe)
        # binding.pry
        Drink.display_all_drinks
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
            lookup_drink_id = gets.chomp
            ## TODO need to get ingredients from user and fill out the rest object details downstream of Drinks
            if cafe.menu.drinks.map{|d| d.id}.include? lookup_drink_id.to_i
                puts "=============================================="    
                puts "This drink is already on your menu. Please try again."
                puts "=============================================="
                add_drink_to_menu(cafe)
            elsif Drink.find_by(lookup_drink_id.to_i)
                new_drink_to_menu = DrinksMenu.new(drink_id: lookup_drink_id.to_i, menu_id: cafe.menu.id)
                new_drink_to_menu.save
                puts "==============================================" 
                puts "Drink saved to your menu"
                puts "==============================================" 
                add_drink_to_menu(cafe)
            else
                puts "Error: Drink ID invalid. Please try again."
                add_drink_to_menu(cafe)
            end
        when "2"
            ## TODO 
            new_drink = Drink.new
            new_drink.save
            new_drink.create_drink
            binding.pry
            

        when "3"
        when "4"
            exit
        else
            puts "Error: Drink ID invalid. Please try again."
            add_drink_to_menu(cafe)
        end
    end

end
