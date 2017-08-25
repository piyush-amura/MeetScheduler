#
# Class CreateMoms provides <description>
#
# @author Joe Blog <Joe.Blog@nowhere.com>
#
class CreateMoms < ActiveRecord::Migration[5.1]
  def change
    create_table :moms do |t|
      t.text :summary
      t.references :meeting, index: true, foreign_key: true
      t.timestamps
    end
  end
end
