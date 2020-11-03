class SitesController < ApplicationController
  # before_action :set_site, only: [:show, :edit, :update, :destroy]

  def destroy
    set_site
    @site.destroy
    redirect_to admin_path
  end

  def edit
    set_site
  end

  def new
    @site = Site.new
  end

  # def index
  #   @sites = Site.all
  # end

  # def show
  #   set_site
  # end

  def update
    set_site
    if @site.update(strong_params)
      redirect_to admin_path
    else
      render 'edit'
    end
  end

  def toggle_confidence
    set_site
    case @site.confidence
    when 'confident'
      @site.update(confidence: 'not sure')
    when 'not sure'
      @site.update(confidence: 'false')
    when 'false'
      @site.update(confidence: 'confident')
    end
    redirect_to admin_path

  end

  private

  def set_site
    @site = Site.find(params[:id])
  end

  # def strong_params
  #   params.require(:site).permit(:name, :site_type, :start_date, :end_date, :amount, :money_unit, :birth_date, company: [ :company_id ], position: [ :position_name ], clients: [ :name ])
  # end

  def strong_params
    params.require(:site).permit(:name, :site_type, :start_date, :end_date, :amount, :money_unit)
  end

  # def site_params
  #   strong_params.except(:position, :clients, :company)
  # end
end
