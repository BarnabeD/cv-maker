class SitesController < ApplicationController
  # before_action :set_site, only: [:show, :edit, :update, :destroy]

  # def destroy
  #   @site.destroy
  #   redirect_to sites_path
  # end

  # def edit
  # end

  # # def index
  # #   @sites = Site.all
  # # end

  # def show
  #   set_site
  # end

  # def update
  #   @site.update(site_params)
  #   redirect_to site_path(@site)
  # end

  # private

  # def set_site
  #   @site = Site.find(params[:id])
  # end

  # def strong_params
  #   params.require(:site).permit(:name, :site_type, :start_date, :end_date, :amount, :money_unit, :birth_date, company: [ :company_id ], position: [ :position_name ], clients: [ :name ])
  # end

  # def site_params
  #   strong_params.except(:position, :clients, :company)
  # end
end
