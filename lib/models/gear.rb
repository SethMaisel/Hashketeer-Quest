class Gear < ActiveRecord::Base
    has_many :character_gears
    has_many :characters, through: :character_gears
    has_many :villain_gears
    has_many :villains, through: :villain_gears
end 