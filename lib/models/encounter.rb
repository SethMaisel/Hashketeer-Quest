class Encounter < ActiveRecord::Base
    belongs_to :character_gears
    belongs_to :villain_gears
    # belongs_to :villain, through: :villain_gears
    # # belongs_to :character, through: :character_gears 
end 