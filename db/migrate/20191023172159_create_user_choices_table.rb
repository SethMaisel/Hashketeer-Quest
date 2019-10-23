class CreateUserChoicesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :user_choices do |t|
      t.references :encounter, foreign_key: true
      t.references :character_gear, foreign_key: true
      t.references :villain_gear, foreign_key: true
    end 
  end
end
