class CommandLineInterface
    attr_accessor :cafe
    
    def run
        greet
        what_next
        
    end

    def greet
        puts 'Welcome to Coffee, the best resource for cafe owners in the world!'
        puts "=============================================="
        Shop.all.each do | shop |
            puts "#{shop.id}. #{shop.name}"
        end
        puts "=============================================="
        puts 'Select your shop to get started:'
        # stretch... are you an owner or customer?
        cafe_id = gets.chomp
        @cafe = Shop.find cafe_id
    end

    def what_next
        puts "=============================================="
        puts "What would you like to do?"
        puts "1. See your menu"
        puts "2. Add an item to your menu"
        puts "3. Remove an item from the menu"
        puts "4. Edit an item's ingredients"
        puts "5. "
        puts "6. Quit"
        puts "Enter a number:"
        # puts "Delete an ingredient"
        puts "=============================================="
        choice = gets.chomp
    
        case choice
        when "1" 
            @cafe.menu.display_my_menu
            what_next
        when "2"
           @cafe.menu.add_drink_to_menu(cafe)
           what_next
        when "3"
            @cafe.menu.remove_from_menu(@cafe)
            what_next
        when "4"
        # TODO: Need to set up Drink.new initialization first
            Drink.edit_drink_ingredients(@cafe)
        # when "5"
        when "6"
            exit
        else
            "Invalid entry. Please try again."
        end
    end
    
end