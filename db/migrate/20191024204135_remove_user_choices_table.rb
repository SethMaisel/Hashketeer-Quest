class RemoveUserChoicesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_choices
  end
end
