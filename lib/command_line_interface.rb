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
        puts "         >>>>>MENU ITEMS<<<<<"
        puts "1. See your menu"
        puts "2. Add an item to your menu"
        puts "3. Remove an item from the menu"
        puts "4. Create a new item"
        puts "         >>>>>INGREDIENTS<<<<<"
        puts "5. See all ingredients"
        puts "6. Create new ingredient" 
        puts "7. EXIT app"
        puts "=============================================="
        puts "Enter a number:"
        puts "=============================================="
        choice = gets.chomp
    
        case choice
        when "1" 
            @cafe.menu.display_my_menu
            what_next
        when "2"
           @cafe.add_item_to_menu
           what_next
        when "3"
            @cafe.remove_from_menu
            what_next
        when "4"
            Drink.new.invent_new_drink
            what_next
        when "5"
            Ingredient.display_all_ingredients
            what_next
        when "6"
            Ingredient.new.add_ingredient
            what_next
        when "7"
            exit
        else
            "Invalid entry. Please try again."
        end
    end
    
end