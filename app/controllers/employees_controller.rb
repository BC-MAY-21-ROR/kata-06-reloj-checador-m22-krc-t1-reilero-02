class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[show edit update]

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.create employee_params
    @employee.save
    redirect_to employees_path
  end

  def show; end

  def edit; end

  def update
    @employee.update employee_params
    redirect_to employees_path
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.required(:employee).permit(:name, :email, :position, :private_number, :active)
  end
end
