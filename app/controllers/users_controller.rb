class UsersController < ApplicationController
  before_action :set_user, only: [:destroy, :edit, :update]
  before_action :check_current_user_admin?, only: :destroy

  def destroy
    set_user
    @user.destroy
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.skip_confirmation!
    if @user.save(validate: false)
      redirect_to root_path
    else
      render '_new'
    end
  end

  def edit
  end

  def update
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email)
  end
end
