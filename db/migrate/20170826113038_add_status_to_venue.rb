# migration class
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class AddStatusToVenue < ActiveRecord::Migration[5.1]
  def change
    add_column :venues, :status, :string, default: 'available'
  end
end
