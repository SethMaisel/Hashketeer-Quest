class CreateCharacterGearTable < ActiveRecord::Migration[6.0]
  
  def change
    create_table :character_gears do |t|
      t.references :character, foreign_key: true
      t.references :gear, foreign_key: true
    end
  end
end
