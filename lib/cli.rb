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
        character_available = create_name_id_hash(Character.all)
        character_id = PROMPT.select("Please select a character to play?", character_available)
        self.character = Character.find(character_id)
    end 
    def name_character
        self.username = PROMPT.ask("What would you like to name your character?")
    end 
    def customize_message(original_message, replace, replacement)
        original_message.gsub replace, replacement
    end 
    def origin_story
        standard_message = self.character.origin
        puts Rainbow(standard_message + "\n").aqua
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
        self.encounter = Encounter.find_by(character_id: self.character.id)
        set_villain
        set_villain_gear
        set_villain_gear_used

        if self.character.name == "Knight"
            standard_message = "\"Thank you, sire.\” creaks the dispirited voice of the ancient peasant.  He rises slowly and toddles from the great hall, leaning heavily on his gnarled cane.\n\“Well, username, booms King Kyle, Lord of the Cohorts, what dost thou make of that? Another smallhold ravaged.  ‘Tis high time someone dealt with this Orc menace!\nI have decided that someone is to be thee, username.  Sally forth and dispense with the oafish rabble.\”\nWith a gracious bow, username dons armor, mounts trusty steed, and rides out from the castle towards the mountains in search of the monsters.\nYou have barley ascended to the snowy foothills, when you are accosted by the first drooling, stinking monstrosity.  It brandishes a crude weapon and roars as you ride to the fray..."
        elsif self.character.name == "Peasant"
            standard_message = "Your grandfather, the grey-bearded patriarch of your family, slowly trudges across the blackened and still-smoking field of your small farm. You rush past the fresh graves of your kin to meet him.\n“Well?  How did the Lord respond to your plea?”, you query.  “Will he send his forces out to meet the threat?”\n“I think not, username.”, pants the old man. “He received me with cold courtesy and dismissed me without promise or comfort.”\nThat clinches it!  It is time for you, username, the last of your family still able to heft the great axe of your forefathers, to take matters into your own hands.\nWith a bag full of restorative - an old family secret that improves vitality (and, incidentally, grants a feeling of pleasant euphoria) - you stalk determinedly into the nearby mountains.\nSoon, you are overwhelmed by a hideous stench.  As the beast leaps from behind a convenient boulder, you shout, “Hello! My name is username!  Killed my father!  Prepare to die!”. It roars in response as you stride confidently to battle…"
        elsif self.character.name == "Monster"
            standard_message = "username skulked back to the cave after another unsuccessful hunt. To call it a cave was exaggeration, had username known the word. It was really a shallow ditch, clawed out of the hard ground of the foothills.  Still, it was home. Had been for years. Ever since username was exiled from the clan for witchcraft.\nEveryorc knew that after the number “three” came the incalculable “many”. username counted to “four”. That qualified as higher math and, as all know, math is witchcraft.\nEnough of that!  username grows tired of counting piles of rocks and eating raw squirrel! The time has come to return to the clan. To lead them to the bright new future of “four”! Unfortunately, the only path back to the clan is a road paved with orc skulls.\nusername lifts the great warhammer, crafted out of an uprooted tree (roots and all) and a big rock, and stomps towards the first orc username sees…"
        end 
        replace_username = customize_message(standard_message, "username", self.username)
        puts Rainbow(replace_username + "\n").green
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
        if gear_id == 0
            self.runaway_chosen = true
        else 
            set_gear(gear_id)
            set_character_gear
        end  
    end 
    def damage_calculation(c_or_v_stats, c_or_v_gear)
        attackpower = c_or_v_stats.attack_power
        weapon_damage = c_or_v_gear.damage
        attack_multiplier = rand(1..9)
        overall_damage = attackpower * weapon_damage * attack_multiplier
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
        standard_message = "Brave username ran away!  Bravely ran away, away.\nWhen danger reared its ugly head, you bravely turned your tail and fled. Yes, brave username turned about and gallantly, you chickened out.\nBravely taking to your feet, you beat a very brave retreat.\nYes, bravest of the brave, username."
        new_message = customize_message(standard_message, "username", self.username)
        puts Rainbow(new_message).red
        self.runaway_chosen = false
    end 
    def character_wins
        puts Rainbow("You Won!").green
        victory_cry = PROMPT.ask("What is you victory cry?")
        standard_message = self.character.winning_text
        replace_username = customize_message(standard_message, "username", self.username)
        replace_victorycry = customize_message(replace_username, "victorycry", victory_cry)
        puts Rainbow(replace_victorycry + "\n").yellow
    end 
    def villain_wins
        puts Rainbow("Villain Wins").red
        last_words = PROMPT.ask("What are your last words?")
        replace_lastwords = customize_message(self.villain.winning_text, "lastwords", last_words)
        puts Rainbow(replace_lastwords + "\n").red
    end 
    def set_health
        villain_health = health_impact(self.villain, self.villain_gear_used, self.character, self.gear_used)
        character_health = health_impact(self.character, self.gear_used, self.villain, self.villain_gear_used)
        self.character.health = character_health
        self.villain.health = villain_health
    end 
    def show_health
        puts Rainbow("\n" + "Your Health: " + self.character.health.to_s).color("green")
        puts Rainbow("Villain Health: " + self.villain.health.to_s + "\n").color("green")
    end 
    def gear_consequence
        set_health
        show_health
    end 
    def determine_victor(character_health, villain_health)
        if villain_health > character_health
            villain_wins
        else 
            character_wins
        end 
    end 
    def self.reset
        username = nil
        character = nil
        gear_used = nil
        villain = nil
        villain_gear = nil
        villain_gear_used = nil
        character_gear = nil
        encounter = nil
        runaway_chosen = false
    end 
end 