class CommandLineInterface
    attr_accessor :cafe
    
    def run
        greet
        what_next
    end

    def greet
        prompt = TTY::Prompt.new(enable_color: true)
        puts "==================================================="
        puts "         Welcome to Manage My Shop"
        puts " the best resource for cafe owners in the world!"
        puts "==================================================="
        list = Shop.all.map do | shop |
                    "#{shop.name}"
                end
        cafe_id = prompt.select("Use arrows & ENTER to select your shop:", list)
        @cafe = Shop.find_by(name: cafe_id)
    end

    def what_next
        prompt = TTY::Prompt.new(enable_color: true)
        puts "=============================================="
        puts "     >>>>>#{@cafe.name}<<<<<"
        puts "               MENU ITEMS"
        puts "        What would you like to do?"
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
            @cafe.menu.display_my_menu
            what_next
        when menu_list[2]
           @cafe.add_item_to_menu
           what_next
        when menu_list[3]
            @cafe.remove_from_menu
            what_next
        when menu_list[4]
            new_drink = Drink.new.invent_new_drink
            if new_drink != nil
                @cafe.menu.drinks_menus.create(menu_id: @cafe.menu.id, drink_id: new_drink.id)
            else @cafe.menu.display_my_menu
            end
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