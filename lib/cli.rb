class CLI
    attr_accessor :username, :character, :gear_used, :villain, :villain_gear, :villain_gear_used, :character_gear, :encounter, :runaway_chosen
    PROMPT = TTY::Prompt.new
    def initialize()
        @username = nil
        @character = nil
        @gear_used = nil
        @villain = nil
        @villain_gear = nil
        @villain_gear_used = nil
        @character_gear = nil
        @encounter = nil
        @runaway_chosen = false
    end 
    def welcome
        puts Rainbow("Welcome to Hashkeeter Quest!").color("green")
    end 
    def create_name_id_hash(original_hash)
        original_hash.reduce(Hash.new()) do |hash, entry|
            hash[entry.name] = entry.id
            hash
        end 
    end 
    def select_character
        #user will choose what character to use 
        #character_available will need to contain an array of all the character objects available
        character_available = create_name_id_hash(Character.all)
        character_id = PROMPT.select("Please select a character to play?", character_available)
        self.character = Character.find(character_id)
    end 
    def name_character
        self.username = PROMPT.ask("What would you like to name your character?")
    end 
    def origin_story
        puts Rainbow(self.character.origin).color("green")
    end 
    def set_villain
        self.villain = Villain.find(self.encounter.villain_id)
    end 
    def set_villain_gear
        self.villain_gear = VillainGear.find_by(villain: self.villain.id)
    end 
    def set_villain_gear_used
        self.villain_gear_used = Gear.find(self.villain_gear.gear_id)
    end 
    def set_gear(id)
        self.gear_used = Gear.find(id)
    end 
    def set_character_gear
        self.character_gear = CharacterGear.find_by(character_id: self.character.id, gear_id: self.gear_used.id)
    end 
    def encounter_story
        #grab the encounter via character_id
        self.encounter = Encounter.find_by(character_id: self.character.id)
        set_villain
        set_villain_gear
        set_villain_gear_used
        puts Rainbow("Encounter").color("green")
    end 
    def add_runaway_option(gear_options)
        gear_options["Run Away"] = 0
    end 
    def select_gear
        character_gear_available = CharacterGear.where(character_id: self.character.id)
        gears = character_gear_available.map do |character_gear|
            Gear.find(character_gear.gear_id)
        end 
        gear_available = create_name_id_hash(gears)
        add_runaway_option(gear_available)
        gear_id = PROMPT.select("What weapon will you use in your encounter with the villain ?", gear_available)
        if gear_id != 0
            set_gear(gear_id)
            set_character_gear
        else 
            self.runaway_chosen = true
        end  
    end 
    def damage_calculation(c_or_v_stats, c_or_v_gear)
        attackpower = c_or_v_stats.attack_power
        weapon_damage = c_or_v_gear.damage
        overall_damage = attackpower * weapon_damage
    end 
    def character_health_calculation(c_or_v_stats, c_or_v_gear)
        gear_health_stats = c_or_v_gear.add_health
        c_or_v_health = c_or_v_stats.health
        overall_health = c_or_v_health + gear_health_stats
    end 
    def health_impact(c_or_v_stats, c_or_v_gear, opponent_stats, opponent_gear)
        overall_health = character_health_calculation(c_or_v_stats, c_or_v_gear)
        overall_damage = damage_calculation(opponent_stats, opponent_gear)
        overall_health - overall_damage
    end 
    def runaway
        puts Rainbow("You Bravely Ran Away from the villain").color("green")
    end 
    def character_wins
        puts Rainbow('You Win').color("green")
        victory_cry = PROMPT.ask("What is you victory cry?")
        puts Rainbow(victory_cry).color("green")
    end 
    def villain_wins
        puts Rainbow("villain Wins").color("green")
        last_words = PROMPT.ask("What are your last words?")
        puts Rainbow(last_words).color("green")
    end 
    def set_health
        villain_health = health_impact(self.villain, self.villain_gear_used, self.character, self.gear_used)
        character_health = health_impact(self.character, self.gear_used, self.villain, self.villain_gear_used)
        # if villain_health > character_health
        #     villain_wins
        # else 
        #     character_wins
        # end 
        self.character.health = character_health
        self.villain.health = villain_health
    end 
    def gear_consequence
        # if self.runaway_chosen == true
        #     runaway
        # else 
            # villain_character_comparison
            set_health
        # end 
    end 
    def determine_victor(character_health, villain_health)
        if villain_health > character_health
            villain_wins
        else 
            character_wins
        end 
    end 
end 