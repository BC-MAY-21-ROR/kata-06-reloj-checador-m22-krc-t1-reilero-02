class AttendencesController < ApplicationController
  def index
    @attendance = Attendance.all
  end

  def day
  end

  def absences
  end
end
