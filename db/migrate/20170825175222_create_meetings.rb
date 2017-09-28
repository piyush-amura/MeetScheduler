# migration class
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class CreateMeetings < ActiveRecord::Migration[5.1]
  def change
    create_table :meetings do |t|
      t.date 'date', null: false
      t.time 'start_time', null: false
      t.string 'status', default: 'on time'
      t.text 'key_note', null: false
      t.float 'duration', precision: 2
      t.references :organiser, index: true, foreign_key: { to_table: :users }
      t.references :venue, index: true
      t.timestamps
    end
  end
end
