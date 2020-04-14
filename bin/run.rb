require_relative '../config/environment'

cli = CommandLineInterface.new
cafe = cli.greet
# binding.pry
cli.owner_menu
