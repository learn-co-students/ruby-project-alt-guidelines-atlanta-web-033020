class CommandLineInterface
    attr_accessor :cafe
    
    def run
        greet
        owner_menu
        
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

    def owner_menu
        puts "=============================================="
        puts "What would you like to do today?"
        puts "1. See the menu"
        puts "2. Search the menu"
        puts "3. Add a drink from the menu"
        puts "4. Remove drink a drink from the menu"
        puts "5. Edit a drink's ingredients"
        puts "6. Quit"
        puts "Enter a number:"
        # puts "Delete an ingredient"
        puts "=============================================="
        choice = gets.chomp
    
        case choice
        when "1" 
           @cafe.menu.display
        # when "2"

        # when "3"
        # when "4"
        # when "5"
        # when "6"
        # binding.pry
        end
    end
    
end