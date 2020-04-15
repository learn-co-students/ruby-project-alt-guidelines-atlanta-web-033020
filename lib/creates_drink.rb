class CreatesDrink

  def initialize
    @ingredients = []
  end

  def run
    set_name
    set_price
    set_ingredients
    create_drink_if_valid
  end

  def create_drink_if_valid
    if @ingredients.any?
      Drink.create(name: @name, price: @price, ingredients: @ingredients)
    else
      puts "=============================================="
      puts "A item need at least one ingredient."
      puts "No new item was created."
      puts "=============================================="
    end
  end

  def add_ingredient_to_drink
    show_all_ingredients
    prompt_for_ingredient_to_add
    @choice = gets.chomp
    
    if Ingredient.id_exists?(@choice)
      @ingredients << Ingredient.find_by(id: @choice.to_i)
    else
      puts "Could not find that ingredient."
    end
  end

  def set_ingredients
    while @choice != "DONE" do
      add_ingredient_to_drink
    end
  end

  def prompt_for_ingredient_to_add
    show_selected_ingredients
    puts "=============================================="
    puts "Select an additional ingredient."
    puts "Enter ID below: "
    puts "Type 'DONE' to finish "
    puts "=============================================="
  end

  def show_selected_ingredients
    @ingredients.each do |ingredient|
      puts "#{ingredient.id} <<<  #{ingredient.name}"
    end
  end

  def show_all_ingredients
    Ingredient.display_all_ingredients
  end

  def set_price
    prompt_for_price
    drink_price = gets.chomp
    @price = drink_price.to_f
  end

  def set_name
    prompt_for_name
    @name = gets.chomp
  end

  def prompt_for_name
    puts "=============================================="    
    puts "Create new menu item"
    puts "Enter the NAME of this item below."
    puts "=============================================="
  end

  def prompt_for_price
    puts "=============================================="    
    puts "Enter the PRICE of this item below."
    puts "=============================================="
  end

  def prompt_for_ingredients
    puts "=============================================="
    puts "What INGREDIENTS does this item have?"
    puts "=============================================="
    puts "Enter ID from list below **OR**"
    puts "type DONE when finished."
    puts "=============================================="
  end
end