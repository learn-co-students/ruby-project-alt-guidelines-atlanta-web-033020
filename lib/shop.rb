class Shop < ActiveRecord::Base

    def add_item_to_menu
        # @cafe = cafe
        selects_menu_item
        adds_item_to_my_menu
    end
    
    def remove_from_menu
        # this method should remove a specified item from a shop's menu.
        self.menu.display_my_menu
        prompts_for_item_to_remove # helper method below
        id = gets.chomp.to_i
        if DrinksMenu.find_by(drink_id: id)
            DrinksMenu.where(menu_id: self.menu.id, drink_id: id).first.destroy
        else
            puts "Item ID is invalid"
        end
        self.menu.drinks.reload
        #This is where I had and issue with menu not displaying menu less the destroyed item
        self.menu.display_my_menu
        puts ">>  Item removed from menu  <<"
    end

    private

    def selects_menu_item
        shows_menu_of_all_items_i_dont_have
        prompts_for_item_to_add
        @choice = gets.chomp
    end

    def adds_item_to_my_menu
        if Drink.find_by(id: @choice)
            new_drink = DrinksMenu.create(menu_id: self.menu.id, drinks_id: @choice)
            #DrinksMenu.all.reload
            puts "=============================================="
            puts "ITEM ADDED TO MENU"
            puts "=============================================="
            self.menu.display_my_menu
        else
            puts "========================================================"
            puts "Could not find that item. Try again or create a new one."
            puts "========================================================"
        end
    end

    def shows_menu_of_all_items_i_dont_have
        # shows what cafe instance DOES NOT have currently on menu
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

    def prompts_for_item_to_remove
        puts "=============================================="
        puts "Which item do you want to remove?"
        puts "Enter the ID and press enter."
        puts "==============================================" 
    end

    def add_drinks
        # this method could keep user looking at menu to add until types "DONE"
        while @choice != "DONE" do
            adds_item_to_my_menu
        end
    end
end