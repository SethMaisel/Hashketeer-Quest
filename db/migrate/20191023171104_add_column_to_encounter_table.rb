class AddColumnToEncounterTable < ActiveRecord::Migration[6.0]
  def change
    add_reference :encounters, :villain, foreign_key: true
    add_reference :encounters, :character, foreign_key: true
  end
end
