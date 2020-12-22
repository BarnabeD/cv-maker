class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy, :toggle_confidence]
  before_action :check_current_user_admin?, only: [:destroy, :new]


  def destroy
    @site.destroy
    redirect_to root_path
  end

  def edit
  end

  def new
    @site = Site.new
  end

  # def index
  #   @sites = Site.all
  # end
  def create
    @site = Site.new(site_params)
    @site.client = set_client
    if @site.save
      redirect_to site_path(@site)
    else
      render :new
    end
  end

  def show
  end

  def update
    if @site.update(site_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def toggle_confidence
    case @site.confidence
    when 'confident'
      @site.update(confidence: 'not sure')
    when 'not sure'
      @site.update(confidence: 'false')
    when 'false'
      @site.update(confidence: 'confident')
    end
    redirect_to root_path
  end

  private

  def set_site
    @site = Site.find(params[:id])
  end

  # def strong_params
  #   params.require(:site).permit(:name, :site_type, :start_date, :end_date, :amount, :money_unit, :birth_date, company: [ :company_id ], position: [ :position_name ], clients: [ :name ])
  # end

  def strong_params
    params.require(:site).permit(:name, :site_type, :start_date, :end_date, :amount, :money_unit, :photo, client: [:id])
  end

  def site_params
    strong_params.permit(:name, :site_type, :start_date, :end_date, :amount, :money_unit, :photo)
  end

  def set_client
    @client = Client.find(strong_params[:client][:id])
  end
  # def site_params
  #   strong_params.except(:position, :clients, :company)
  # end
end
