# migration class
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class CreateAgendas < ActiveRecord::Migration[5.1]
  def change
    create_table :agendas do |t|
      t.references :mom, index: true, foreign_key: true, null: false
      t.string 'name', null: false
      t.integer 'allocated_time', default: 30, null: false
      t.string 'action', null: false
      t.string 'status', default: 'approval needed', null: false
      t.timestamps
    end
  end
end
