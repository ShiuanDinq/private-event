class AttendancesController < ApplicationController
  def create
    attendance = Attendance.new
    attendance.attended_event_id = params[:attended_event_id]
    attendance.event_attendee_id = params[:event_attendee_id]

    attendance.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    attendance = Attendance.find(params[:id])
    attendance.destroy
    redirect_back(fallback_location: root_path)
  end
end
