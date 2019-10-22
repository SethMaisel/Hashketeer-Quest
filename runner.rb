require_relative "./config/environment"

cli = CLI.new();
cli.welcome
cli.select_character
cli.name_character
cli.origin_story
cli.encounter_story
weapon_choice = cli.select_gear
cli.gear_consequence(weapon_choice)
binding.pry