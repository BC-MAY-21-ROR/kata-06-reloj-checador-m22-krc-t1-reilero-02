class EmployeesController < ApplicationController
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

  def show
    @employee = Employee.find(params[:id])
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    @employee.update employee_params
    @employee.save
    redirect_to employees_path
  end

  private

  def employee_params
    params.required(:employee).permit(:name, :email, :position, :employee_id, :private_number, :active)
  end
end
