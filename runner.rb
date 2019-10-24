require_relative "./config/environment"

cli = CLI.new();
cli.welcome
loop do
    cli.select_character
    cli.name_character
    cli.origin_story
    cli.encounter_story
    loop do 
        cli.select_gear
        cli.gear_consequence
        break if cli.character.health <= 0 || cli.villain.health <= 0 || cli.runaway_chosen == true
        # binding.pry
    end 
    if cli.runaway_chosen == true
        cli.runaway
    else 
        cli.determine_victor(cli.character.health, cli.villain.health)
    end 
    break if TTY::Prompt.new.yes?("Do you want to play again?") == false
end