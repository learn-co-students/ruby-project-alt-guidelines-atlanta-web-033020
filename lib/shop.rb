class Shop < ActiveRecord::Base
    has_one :menu
    
    def add_item_to_menu
        prompt = TTY::Prompt.new
        prompts_for_item_to_add
        # shows what cafe instance DOES NOT have currently on menu
        items = Drink.all - self.menu.drinks
        menu_list =  items.map {|item| item.name}
        @choice = prompt.select("Use arrows & ENTER to select your shop:", menu_list << "EXIT")
        puts "=============================================="
        # binding.pry
        if @choice != "EXIT"
            new_drink_id = Drink.find_by(name: @choice).id
            new_drink = DrinksMenu.new(menu_id: self.menu.id, drink_id: new_drink_id)
            new_drink.save!
            self.reload
            puts "=============================================="
            puts "            ITEM ADDED TO MENU"
            puts "=============================================="
            self.menu.display_my_menu
        end
    end
    
    def remove_from_menu
        # this method should remove a specified item from a shop's menu.
        prompt = TTY::Prompt.new
        prompts_for_item_to_remove
        menu_list =  self.menu.drinks_menus.map {|dm| dm.drink.name}
        
        # Gets user selection of "item name"
        drink_name = prompt.select("Use arrows & ENTER to select your shop:", menu_list << "EXIT")
        
        # Finds drink_id for item and assign to variable to shorten
        drink_id_to_remove = self.menu.drinks.find_by(name: drink_name)
        
        # Isolates DrinksMenu table row in var named 'removal' then destroys the record
        removal = DrinksMenu.where(menu_id: self.menu.id, drink_id: drink_id_to_remove).first
        removal.destroy
        
        # local variavle for self must be updated in order for menu to display change
        self.reload
        self.menu.display_my_menu
        puts ">>  Item removed from menu  <<"
    end

    def shows_menu_of_all_items_i_dont_have
        prompt = TTY::Prompt.new
        # shows what cafe instance DOES NOT have currently on menu
        puts "=============================================="
        puts "           Choose from below to"
        puts "           **ADD** TO YOUR MENU"
        puts "=============================================="
        items = Drink.all - self.menu.drinks
        list =  items.map do |item|
            puts "#{item.name}"
            end
        puts "=============================================="
    end

    def prompts_for_item_to_add
        puts "=============================================="
        puts "           Choose from below to  "
        puts "           **ADD** TO YOUR MENU"
        puts "=============================================="
    end

    def prompts_for_item_to_remove
        puts "=============================================="
        puts "             MY CURRENT MENU"
        puts "=============================================="
        puts "=============================================="
        puts "     Which item do you want to remove?"
    end

end