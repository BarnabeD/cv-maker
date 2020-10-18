class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy]

  def create
    @site = Site.new(site_params)
    client = Client.new(strong_params[:clients])
    @worker = Worker.find(params[:worker_id])
    position = Position.new(strong_params[:position])
    position.company = Company.new(strong_params[:compagnies])
    position.site = @site
    @site.client = client
    position.worker = @worker

    if @site.save && position.save
      redirect_to worker_path(@worker)
    else
      raise
      render '_new'
    end
  end

  def destroy
    @site.destroy
    redirect_to sites_path
  end

  def edit
  end

  def index
    @sites = Site.all
  end

  def new
    @site = Site.new
    @worker = Worker.find(params[:worker_id])
    # @site.position.build
    # @site.client.build
  end

  def show
    set_site
  end

  def update
    @site.update(site_params)
    redirect_to site_path(@site)
  end

  private

  def set_site
    @site = Site.find(params[:id])
  end

  def strong_params
    params.require(:site).permit(:name, :site_type, :start_date, :end_date, :amount, :money_unit, :birth_date, position: [ :position_name ], clients: [ :name ], compagnies: [ :name, :city ])
  end

  def site_params
    strong_params.except(:position, :clients, :compagnies)
  end
end
