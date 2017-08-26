# migration class
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.references :user, foreign_key: true, null: false
      t.references :agenda, foreign_key: true, null: false
      t.text :suggestion, null: false
      t.timestamps
    end
    add_index :suggestions, %w[user_id agenda_id]
  end
end
