class CreateCharacterTable < ActiveRecord::Migration[6.0]
  
  def change
    create_table :characters do |t|
    t.string :name
    t.text :origin
    t.text :winning_text
    t.integer :attack_power
    t.integer :health
    end
  end
end
