class VillainGear < ActiveRecord::Base
    belongs_to :villain
    belongs_to :gear
    has_many :encounters
end
