class CLI
    attr_accessor :username, :character, :gear_used, :villain, :villain_gear, :villain_gear_used, :character_gear, :encounter
    attr_reader :prompt
    def initialize()
        @username = nil
        @character = nil
        @gear_used = nil
        @villain = nil
        @villain_gear = nil
        @villain_gear_used = nil
        @character_gear = nil
        @encounter = nil
        @prompt = TTY::Prompt.new
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
        character_id = @prompt.select("Please select a character to play?", character_available)
        self.character = Character.find(character_id)
    end 
    def name_character
        self.username = @prompt.ask("What would you like to name your character?")
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
    def encounter_story
        #grab the encounter via character_id
        self.encounter = Encounter.find_by(character_id: self.character.id)
        set_villain
        set_villain_gear
        set_villain_gear_used
        puts Rainbow("Encounter").color("green")
    end 
    def select_gear
        self.character_gear = CharacterGear.where(character_id: self.character.id)
        gears = self.character_gear.map do |character_gear|
            Gear.find(character_gear.gear_id)
        end 
        binding.pry
        # gear_available = ["sword", "mace", "health postion","run away"]
        # weapon_choice = @prompt.select("What weapon will you use in your encounter with the villain ?", gear_available)
    end 
#     def damage_calculation(stats)
#         attackpower = 2
#         weapon_damage = 30
#         overall_damage = attackpower * weapon_damage
#     end 
#     def character_health_calculation(gear_join_table_information, character_stats)
#         gear_health_stats = 0
#         character_health = 100
#         overall_health = character_health + gear_health_stats
#     end 
#     def health_impact(information)
#         overall_health = character_health_calculation("gearinformation", "stats")
#         overall_damage = damage_calculation("information")
#         overall_health - overall_damage
#     end 
#     def run_away
#         puts "You Bravely Ran Away from the villain"
#     end 
#     def character_wins
#         puts 'You Win'
#         victory_cry = @prompt.ask("What is you victory cry?")
#         puts "Story Line with Victory Cry"
#     end 
#     def villain_wins
#         puts "villain Wins"
#         last_words = @prompt.ask("What are your last words?")
#         puts "Story Line with Last Words"
#     end 
#     def villain_character_comparison
#         villain_health = health_impact("stats")
#         character_health = health_impact("stats")
#         if villain_health > character_health
#             villain_wins
#         else 
#             character_wins
#         end 
#     end 
#     def gear_consequence(weapon_choice)
#         if weapon_choice == "Run Away"
#             run_away
#         else 
#             villain_character_comparison
#         end 
#     end 
end 