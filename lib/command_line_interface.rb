class CommandLineInterface
    attr_accessor :cafe
    
    def run
        greet
        what_next
    end

    def greet
        prompt = TTY::Prompt.new(active_color: :yellow)
        font = TTY::Font.new(:standard)
        pastel = Pastel.new
        displays_greet_banner
        list_for_menu = Shop.all.map { | shop | "#{shop.name}" }
        cafe_name = prompt.select("Use arrows & ENTER to select your shop:", list_for_menu)
        @cafe = Shop.find_by(name: cafe_name)
    end

    def what_next
        prompt = TTY::Prompt.new(active_color: :yellow)
        display_main_menu
            menu_list = [
            "See your menu",
            "Add an item to your menu",
            "Remove an item from the menu",
            "Create a new item",
            "See all ingredients",
            "Create new ingredient"]
        @choice = prompt.select("Use arrows & ENTER to select your shop:", menu_list.unshift("EXIT"))
        
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

    def display_main_menu
        font = TTY::Font.new(:standard)
        pastel = Pastel.new
        puts pastel.red("===================================================")
        puts pastel.yellow("            #{@cafe.name}")
        puts pastel.yellow("               MENU ITEMS")
        puts pastel.yellow("        What would you like to do?")
        puts pastel.red("===================================================")
    end

    def displays_greet_banner
        font = TTY::Font.new(:standard)
        pastel = Pastel.new
        puts pastel.red("===================================================")
        puts pastel.yellow(font.write("COFFEE"))
        puts pastel.yellow(" the best resource for cafe owners in the world!")
        puts pastel.red("===================================================")
    end

end