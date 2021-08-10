class AddFieldsToAttendance < ActiveRecord::Migration[6.1]
  def change
    add_column :attendances, :event_attendee_id, :integer
    add_column :attendances, :attended_event_id, :integer
  end
end
