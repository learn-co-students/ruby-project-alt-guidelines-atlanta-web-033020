class AddDrinkToMenu

    def run(cafe)
        @cafe = cafe
        selects_menu_item
        adds_item_to_my_menu
        shows_my_menu
    end

    def shows_menu_of_all_items_i_dont_have
        # self.menu.display_my_menu displays what I have
        # need to see what I DO NOT have currently on my menu

        # QUESTION: how can I use ActiveRecord to find items not on my menu? I can think of a way to draft an SQL query using heredoc... cafe.menu.drinks.where(shop.id: != self.id)
        puts "=============================================="
        puts "ITEMS AVAILABLE TO ADD TO MY MENU"
        puts "=============================================="
        items = Drink.all - self.menu.drinks
        items.each do |item|
            puts "Drink ID ===>>(#{each.id})<<=== #{each.name}"
        end
        puts "=============================================="
    end

    def prompts_for_item_to_add
        puts "=============================================="
        puts "What items would you like to add? Pick one:" 
        puts "=> Enter ID below: "
        puts "=> Type DONE when finished"
        puts "=============================================="
    end

    def selects_menu_item
        shows_menu_of_all_items_i_dont_have
        prompts_for_item_to_add
        @choice = gets.chomp
    end

    def add_drinks
        while @choice != "DONE" do
            adds_item_to_my_menu
        end
      end

    def adds_item_to_my_menu
        if Drink.id_exists?(@choice)
            new_drink = DrinksMenu.new(menu_id: cafe.menu.id, drinks_id: @choice)
            new_drink.save.reload
            DrinksMenu.all.reload
            shows_menu_of_all_items_i_dont_have
        else
            puts "========================================================"
            puts "Could not find that item. Try again or create a new one."
            puts "========================================================"
        end
    end
end