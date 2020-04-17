class CommandLineInterface
    attr_accessor :cafe
    
    def run
        greet
        what_next
    end

    def greet
        prompt = TTY::Prompt.new
        puts "==============================================="
        puts "         Welcome to Manage My Shop"
        puts "the best resource for cafe owners in the world!"
        puts "==============================================="
        list = Shop.all.map do | shop |
                    "#{shop.name}"
                end
        cafe_id = prompt.select("Use arrows & ENTER to select your shop:", list)
        @cafe = Shop.find_by(name: cafe_id)
    end

    def what_next
        prompt = TTY::Prompt.new
        puts "=============================================="
        puts "         >>>>>MENU ITEMS<<<<<"
        puts "      What would you like to do?"
        puts "=============================================="
            menu_list = [
            "See your menu",
            "Add an item to your menu",
            "Remove an item from the menu",
            "Create a new item",
            "See all ingredients",
            "Create new ingredient"
            ]
        @choice = prompt.select("Use arrows & ENTER to select your shop:", menu_list.unshift("EXIT"))
        puts "=============================================="
        
        case @choice
        when menu_list[1]
            cafe.menu.display_my_menu
            what_next
        when menu_list[2]
           @cafe.add_item_to_menu
           what_next
        when menu_list[3]
            @cafe.remove_from_menu
            what_next
        when menu_list[4]
            Drink.new.invent_new_drink
            what_next
        when menu_list[5]
            Ingredient.display_all_ingredients
            what_next
        when menu_list[6]
            Ingredient.new.add_ingredient
            what_next
        when menu_list[0]
            exit
        end
    end
end