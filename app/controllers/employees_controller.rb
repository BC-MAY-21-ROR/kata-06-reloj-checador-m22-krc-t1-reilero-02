class EmployeesController < ApplicationController
  include AuthenticateAdmin
  before_action :authenticate_admin!
  before_action :set_employee, only: %i[show edit update]

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.create employee_params
    if @employee.save
      redirect_to employees_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @employee.update employee_params
      redirect_to employees_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :position,
      :private_number,
      :active
    )
  end
end
