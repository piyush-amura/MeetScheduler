# migration class
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class CreateMeetingUserJoin < ActiveRecord::Migration[5.1]
  def change
    create_table :meetings_users, id: false do |t|
      t.references :user, index: true
      t.references :meeting, index: true
    end
  end
end
