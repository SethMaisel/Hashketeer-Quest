require_relative "./config/environment"

cli = CLI.new();
cli.welcome
loop do
    cli.select_character
    cli.name_character
    cli.origin_story
    cli.encounter_story
    cli.select_gear
    cli.gear_consequence
    break if TTY::Prompt.new.yes?("Do you want to play again?") == false
end
# binding.pry