class CompaniesController < ApplicationController
  before_action :set_company, only: [:edit, :update, :destroy]

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to admin_path
    else
      render :new
    end
  end

  def destroy
    @company.destroy
    redirect_to admin_path
  end

  def edit
  end

  def new
    @company = Company.new
  end

  def update
    @company.update(company_params)
    redirect_to admin_path
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :city)
  end
end
