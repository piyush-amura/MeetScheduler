#
# Class CreateAgendas provides <description>
#
# @author Joe Blog <Joe.Blog@nowhere.com>
#
class CreateAgendas < ActiveRecord::Migration[5.1]
  def change
    create_table :agendas do |t|
      t.references :mom, index: true, foreign_key: true
      t.string 'name'
      t.integer 'allocated_time'
      t.string 'action'
      t.string 'status'
      t.timestamps
    end
  end
end
