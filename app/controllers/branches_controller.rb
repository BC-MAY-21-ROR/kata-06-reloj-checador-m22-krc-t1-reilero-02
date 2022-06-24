class BranchesController < ApplicationController
  include AuthenticateAdmin
  before_action :authenticate_admin!
  before_action :set_branch, only: %i[show edit update destroy]

  def index
    per_page ||= 8
    @pagy, @branches = pagy(Branch.all, items: per_page)
  end

  def show; end

  def new
    @branch = Branch.new
  end

  def edit; end

  def create
    @branch = Branch.new(branch_params)

    respond_to do |format|
      if @branch.save
        format.html { redirect_to branches_path, notice: 'Branch was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @branch.update(branch_params)
        format.html { redirect_to branches_path, notice: 'Branch was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @branch.destroy

    respond_to do |format|
      format.html { redirect_to branches_url, notice: 'Branch was successfully destroyed.' }
    end
  end

  private

  def set_branch
    @branch = Branch.find(params[:id])
  end

  def branch_params
    params.require(:branch).permit(:name, :address)
  end
end
