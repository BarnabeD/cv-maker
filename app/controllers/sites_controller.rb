class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy]

  def create
    @site = Site.new(site_params)
    if @site.save
      redirect_to site_path(@site)
    else
      render :new
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
    params.require(:site).permit(:first_name, :last_name, :birth_date, :hire_date, :matricule)
  end
end
