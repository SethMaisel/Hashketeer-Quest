class Villain < ActiveRecord::Base
    has_many :villain_gears
    has_many :gears, through: :villain_gears
    # has_many :encounters, through: :villain_gears
end 