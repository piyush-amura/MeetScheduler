#
# Class CreateMeetings provides <description>
#
# @author Joe Blog <Joe.Blog@nowhere.com>
#
class CreateMeetings < ActiveRecord::Migration[5.1]
  def change
    create_table :meetings do |t|
      t.date 'date'
      t.time 'start_time'
      t.string 'status'
      t.text 'key_note'
      t.float 'duration', precision: 2
      t.references :organiser, index: true, foreign_key: { to_table: :users }
      t.references :venue, index: true, foreign_key: true
      t.timestamps
    end
  end
end
