class AttendancesController < ApplicationController
  before_action :set_attendance, only: %i[ show edit update destroy ]

  def index
    @attendance = Attendance.all
  end

  def new
    @attendances = Attendance.new
  end

  def show
    @attendance = Attendance.new(params[private_params])
  end

  def edit
    @attendance = Attendance.find(params[:id])
  end
end
