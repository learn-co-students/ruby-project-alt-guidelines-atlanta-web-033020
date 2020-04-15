class EditDrinkOnMyMenu

    # def run(cafe)
    #     @cafe = cafe
    #     find_menu_item
    #     get_edits
    # end

    # def get_one_edit
    #     prompt_for_changes
    #     @change = gets.chomp
    #     if @change == "1"
    #     if @change == "2"
    #     if @change == "3"
    # end
    
    # def find_menu_item
    #     prompt_for_item_to_edit
    #     @choice = gets.chomp
    #     if Drink.id_exists?(@choice)
    #         @item = Drink.all.find(@choice)
    #     else
    #         error_message
    #     end
    # end
    
    # def prompt_for_item_to_edit
    #     self.menu.display_my_menu
    #     puts "=============================================="    
    #     puts "Which item would you like to edit?"
    #     puts "Input the ID and press enter"
    #     puts "Type 'DONE' when finished."
    #     puts "=============================================="
    # end

    # def prompt_for_changes
    #     puts "=============================================="    
    #     puts "What do you want to change about this item?"
    #     puts "1. Item name:  #{@item.name}"
    #     puts "2. Item price: $#{@item.price}"
    #     puts "3. Item ingredients:"
    #     @item.ingredients.each_with_index do |ing, index|
    #         puts "   #{index + 4}. #{ing.name}"
    #     end
    #     puts "=============================================="
    #     puts ">>>>Enter one number below<<<<"
    #     puts "=============================================="
    # end

    # def error_message
    #     puts "=============================================="    
    #     puts "That item ID is not valid. Please try again."
    #     puts "=============================================="
    # end

    #  # def edit_item
    # #     while @choice != "DONE" do
    # #         make_changes
    # #     end
    # # end

    # # def make_changes
    # #     find_menu_item

end