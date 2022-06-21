class EmployeesController < ApplicationController
  include AuthenticateAdmin
  before_action :authenticate_admin!
  before_action :set_employee, only: %i[show edit update update_status]
  before_action :set_branches, only: %i[new edit create update]

  def index
    per_page ||= 8
    @pagy, @employees = pagy(User.all, items: per_page)
  end

  def new
    @employee = User.new
  end

  def create
    @employee = User.create employee_params
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

  def update_status
    @employee.update(active: !@employee.active)
    redirect_to employees_path
  end

  private

  def set_employee
    @employee = User.find(params[:id])
  end

  def set_branches
    @branches = Branch.all
  end

  def employee_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :position,
      :private_number,
      :active,
      :branch_id
    )
  end
end
