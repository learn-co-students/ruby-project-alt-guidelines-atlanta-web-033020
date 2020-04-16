class Shop < ActiveRecord::Base
    has_one :menu

    def add_item_to_menu
        prompt = TTY::Prompt.new
        # shows what cafe instance DOES NOT have currently on menu
        puts "=============================================="
        puts "           Choose from below to  "
        puts "           **ADD** TO YOUR MENU"
        puts "=============================================="
        items = Drink.all - self.menu.drinks
        list = []
        # list =  items.each { |item| puts "#{item.name}"}
        list =  items.map {|item| item.name}
        @choice = prompt.select("Use arrows & ENTER to select your shop:", list << "EXIT")
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
        puts "=============================================="
        puts "             MY CURRENT MENU"
        puts "=============================================="
        list =  self.drinks_menus.each {|dm| puts "#{dm.drink.name}"}
        puts "=============================================="
        prompts_for_item_to_remove
        id = prompt.select("Use arrows & ENTER to select your shop:", list)
            if DrinksMenu.find_by(drink_id: id.to_i)
                DrinksMenu.where(menu_id: self.menu.id, drink_id: id.to_i).first.destroy
            else
                puts "Item ID is invalid"
            end
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

end