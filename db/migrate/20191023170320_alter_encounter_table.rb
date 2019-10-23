class AlterEncounterTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :encounters, :villain_gear, :references
    remove_column :encounters, :character_gear, :references
  end
end
