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
        if cli.runaway_chosen != true
            cli.gear_consequence
        end
        break if cli.character.health <= 0 || cli.villain.health <= 0 || cli.runaway_chosen == true
    end 
    if cli.runaway_chosen == true
        cli.runaway
    else 
        cli.determine_victor(cli.character.health, cli.villain.health)
    end 
    CLI.reset
    break if TTY::Prompt.new.yes?("Do you want to play again?") == false
end