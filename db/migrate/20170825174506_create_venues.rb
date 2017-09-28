# migration class
# @author Piyush Wani <piyush.wani@amuratech.com>
class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.string  :name, null: false
      t.text    :address, null: false
      t.integer :capacity, default: 10, null: false
      t.timestamps
    end
  end
end
