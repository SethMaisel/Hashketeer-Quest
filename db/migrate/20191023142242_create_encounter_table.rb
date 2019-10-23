class CreateEncounterTable < ActiveRecord::Migration[6.0]
  
  def change
    create_table :encounters do |t|
    t.references :character_gear, foreign_key: true
    t.references :villain_gear, foreign_key: true
    t.string :setting
    end
  end
end
