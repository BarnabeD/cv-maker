class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profil_show
    set_user
  end

  def profil_update
    set_user
    if @user.update(strong_params)
      redirect_to profil_path(@user)
    else
      redirect_to profil_path(@user)
    end
  end

  def admin
    if params[:worker_query].present?
      @workers = Worker.search_by_fullname(params[:worker_query])
    else
      @workers = Worker.all.order(:id)
    end
    @sites = Site.all.order(:id)
    @users = User.all.order(:id)
    @positions = Position.all.order(:id)
    @companies = Company.all.order(:id)
  end

  private

  def strong_params
    params.require(:user).permit(:photo)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
