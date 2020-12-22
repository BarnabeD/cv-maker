class CompaniesController < ApplicationController
  before_action :set_company, only: [:edit, :update, :destroy]
  before_action :check_current_user_admin?


  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @company.destroy
    redirect_to root_path
  end

  def edit
  end

  def new
    @company = Company.new
  end

  def update
    if @company.update(company_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :city)
  end
end
