class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def show
    set_user
  end

  def update
    set_user
    if @user.update(strong_params)
      redirect_to profil_path(@user)
    else
      redirect_to profil_path(@user)
    end
  end

  private

  def strong_params
    params.require(:user).permit(:photo)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
