class CLI
    attr_reader :character, :gear, :villain, :character_gear, :encounter, :prompt
    def initialize()
        @character = nil
        @gear = nil
        @villain = nil
        @character_gear = nil
        @encounter = nil
        @prompt = TTY::Prompt.new
    end 
    def welcome
        puts Rainbow("Welcome to Hashkeeter Quest!").color("green")
    end 
    def select_character
        #user will choose what character to use 
        #character_available will need to contain an array of all the character objects available
        character_available = ["knight", "peasant", "ogre"]
        @character = @prompt.select("Please select a character to play?",character_available)
    end 
    def name_character
        user_input = @prompt.ask("What would you like to name your character?")
        #insert user's name choice into Character user_name attribute
    end 
    def origin_story
        puts Rainbow("Origin Story based on character").color("green")
    end 
    def encounter_story
        #grab the information from the encounter table 
        puts Rainbow("Encounter Story").color("green")
    end 
    def select_gear
        gear_available = ["sword", "mace", "health postion","run away"]
        weapon_choice = @prompt.select("What weapon will you use in your encounter with the villain ?", gear_available)
    end 
    def damage_calculation(stats)
        attackpower = 2
        weapon_damage = 30
        overall_damage = attackpower * weapon_damage
    end 
    def character_health_calculation(gear_join_table_information, character_stats)
        gear_health_stats = 0
        character_health = 100
        overall_health = character_health + gear_health_stats
    end 
    def health_impact(information)
        overall_health = character_health_calculation("gearinformation", "stats")
        overall_damage = damage_calculation("information")
        overall_health - overall_damage
    end 
    def run_away
        puts "You Bravely Ran Away from the villain"
    end 
    def character_wins
        puts 'You Win'
        victory_cry = @prompt.ask("What is you victory cry?")
        puts "Story Line with Victory Cry"
    end 
    def villain_wins
        puts "villain Wins"
        last_words = @prompt.ask("What are your last words?")
        puts "Story Line with Last Words"
    end 
    def villain_character_comparison
        villain_health = health_impact("stats")
        character_health = health_impact("stats")
        if villain_health > character_health
            villain_wins
        else 
            character_wins
        end 
    end 
    def gear_consequence(weapon_choice)
        if weapon_choice == "Run Away"
            run_away
        else 
            villain_character_comparison
        end 
    end 
end 