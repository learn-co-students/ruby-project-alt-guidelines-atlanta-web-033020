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
            # |drink, index| are here in case we wanted a numbered list but that may confuse user and yield index input rather than drink_id
        end
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
            lookup_drink_id = gets.chomp
            ## TODO need to get ingredients from user and fill out the rest object details downstream of Drinks
            if cafe.menu.drinks.map{|d| d.id}.include? lookup_drink_id.to_i
                puts "=============================================="    
                puts "This drink is already on your menu. Please try again."
                puts "=============================================="
                add_drink_to_menu(cafe)
            elsif Drink.all.map {|d| d.id}.include? lookup_drink_id.to_i
                new_drink_to_menu = DrinksMenu.new(drink_id: lookup_drink_id.to_i, menu_id: cafe.menu.id)
                new_drink_to_menu.save
                binding.pry
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
        when "3"
        when "4"
            exit
        else
            puts "Error: Drink ID invalid. Please try again."
            add_drink_to_menu(cafe)
        end
    end

    def remove_from_menu(cafe)
    # this method should remove a specified item from a shop's menu.
    # cafe object and drink_id must be passed in as arguments.
        display_my_menu
        puts "=============================================="
        puts "Which item do you want to remove?"
        puts "Enter the ID and press enter."
        puts "=============================================="    
        id_string = gets.chomp
        id = id_string.to_i
        # binding.pry
        DrinksMenu.where(menu_id: cafe.menu.id, drink_id: id).first.destroy
        cafe.menu.drinks.reload
        display_my_menu
        puts ">>  Item removed from menu  <<"
    end

end
