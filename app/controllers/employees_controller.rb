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

  def employee_params 
    params.required(:employee).permit(:name, :email, :position, :employee_id, :private_number)
  end
end
