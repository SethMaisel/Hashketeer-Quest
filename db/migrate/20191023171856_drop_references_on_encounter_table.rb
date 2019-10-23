class DropReferencesOnEncounterTable < ActiveRecord::Migration[6.0]
  def change
    remove_reference :encounters, :villain_gear, foreign_key: true
    remove_reference :encounters, :character_gear, foreign_key: true
  end
end
