class CreateGearTable < ActiveRecord::Migration[6.0]
  
  def change
    create_table :gears do |t|
    t.string :name
    t.integer :damage
    t.integer :add_health
    end
  end
end
