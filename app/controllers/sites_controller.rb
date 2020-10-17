class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy]

  def create
    @site = Site.new(site_params)
    @worker = Worker.find(params[:worker_id])
    if @site.save
      redirect_to worker_path(@worker)
    else
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

  def site_params
    params.require(:site).permit(:name, :site_type, :start_date, :end_date, :amount, :money_unit, :birth_date)
  end
end
