require_relative "./config/environment"

cli = CLI.new();
cli.welcome
cli.select_character
cli.name_character
cli.origin_story
cli.encounter_story
cli.select_gear
cli.gear_consequence
# binding.pry