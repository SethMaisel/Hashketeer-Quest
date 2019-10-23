class Character < ActiveRecord::Base
    has_many :character_gears
    has_many :gears, through: :character_gears
end 