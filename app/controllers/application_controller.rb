class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def check_current_user_admin?
    redirect_to root_path unless current_user.admin?
  end
end
