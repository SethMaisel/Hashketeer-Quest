class CreateVillainTable < ActiveRecord::Migration[6.0]
  
  def change
    create_table :villains do |t|
      t.string :name
      t.integer :attack_power
      t.integer :health
      t.text :winning_text
    end
  end
end
