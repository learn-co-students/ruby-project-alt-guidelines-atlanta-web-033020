class Shop < ActiveRecord::Base
    has_one :menu
    
    def add_item_to_menu
        prompt = TTY::Prompt.new(enable_color: true)
        font = TTY::Font.new(:standard)
        pastel = Pastel.new
        prompts_for_item_to_add
        # shows what cafe instance DOES NOT have currently on menu
        items_list = Drink.all - self.menu.drinks
        menu_list = items_list.collect {|i| i.name}
        @choice = prompt.select("Use arrows & ENTER to select your shop:", menu_list.unshift("EXIT menu"))
        puts pastel.red("===================================================")
        if @choice != menu_list[0]
            new_drink_id = Drink.find_by(name: @choice).id
            new_drink = DrinksMenu.new(menu_id: self.menu.id, drink_id: new_drink_id)
            new_drink.save!
            self.reload
            puts pastel.red("===================================================")
            puts pastel.yellow("            ITEM ADDED TO MENU")
            puts pastel.red("===================================================")
            self.menu.display_my_menu
        end
    end
    
    def remove_from_menu
        # this method should remove a specified item from a shop's menu.
        prompt = TTY::Prompt.new(active_color: :yellow)
        font = TTY::Font.new(:standard)
        pastel = Pastel.new
        
        # Procedure
        prompts_for_item_to_remove
        menu_list =  self.menu.drinks.collect { |drink| drink.name }
        
        # Gets user selection of "item name"
        choice = prompt.select("Use arrows & ENTER to select your shop:", menu_list << "EXIT")
        
        # Finds drink_id for item and assign to variable to shorten
        drink_to_remove = self.menu.drinks.find_by(name: choice)
        
        # Isolates DrinksMenu table row in var named 'removal' then destroys the record
        removal = DrinksMenu.where(menu_id: self.menu.id, drink_id: drink_to_remove).first
        removal.destroy
        
        # local variavle for self must be updated in order for menu to display change
        self.reload
        self.menu.display_my_menu
        puts pastel.yellow(">>  Item removed from menu  <<")
    end

    def shows_menu_of_all_items_i_dont_have
        prompt = TTY::Prompt.new(active_color: :yellow)
        font = TTY::Font.new(:standard)
        pastel = Pastel.new
        # shows what cafe instance DOES NOT have currently on menu
        puts pastel.red("===================================================")
        puts pastel.yellow("           Choose from below to")
        puts pastel.yellow("           **ADD** TO YOUR MENU")
        puts pastel.red("===================================================")
        items_list = Drink.all - self.menu.drinks
        menu_list = items_list.collect {|item| i.name}
            puts "#{item.name}"
            end
        puts pastel.red("===================================================")
    end

    def prompts_for_item_to_add
        font = TTY::Font.new(:standard)
        pastel = Pastel.new
        puts pastel.red("===================================================")
        puts pastel.yellow("           Choose from below to  ")
        puts pastel.yellow("           **ADD** TO YOUR MENU")
        puts pastel.red("===================================================")
    end

    def prompts_for_item_to_remove
        font = TTY::Font.new(:standard)
        pastel = Pastel.new
        puts pastel.red("===================================================")
        puts pastel.yellow("             MY CURRENT MENU")
        puts pastel.red("===================================================")
        puts pastel.red("===================================================")
        puts pastel.yellow("     Which item do you want to remove?")
    end

end