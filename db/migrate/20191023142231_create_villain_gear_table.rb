class CreateVillainGearTable < ActiveRecord::Migration[6.0]
  
  def change
    create_table :villain_gears do |t|
      t.references :villain, foreign_key: true
      t.references :gear, foreign_key: true
    end
  end
end
