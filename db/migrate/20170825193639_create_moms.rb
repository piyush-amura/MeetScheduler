# migration class
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class CreateMoms < ActiveRecord::Migration[5.1]
  def change
    create_table :moms do |t|
      t.text :summary, null: false
      t.references :meeting, index: true, foreign_key: true
      t.timestamps
    end
  end
end
