class UsersController < ApplicationController

  def destroy
    set_user
    @user.destroy
    redirect_to admin_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
