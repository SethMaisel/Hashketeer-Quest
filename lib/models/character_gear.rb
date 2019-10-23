class CharacterGear < ActiveRecord::Base
    belongs_to :character
    belongs_to :gear
    has_many :encounters
end 