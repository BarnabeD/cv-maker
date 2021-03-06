class PositionsController < ApplicationController
  before_action :set_position, only: [:edit, :update, :destroy]

  def create
    @worker = set_worker
    @position = Position.new(position_params)
    company = Company.find(strong_params[:company_attributes][:id])
    @position.create_site(strong_params[:site_attributes])
    @position.company = company
    @position.site.create_client(strong_params[:clients])
    @position.worker = @worker

    if @position.save
      redirect_to worker_path(@worker)
    else
      render '_new'
    end
  end

  def new
    @position = Position.new
    @position.build_company
    @position.build_site
  end

  def edit
    @worker = @position.worker
  end

  def update
    @position.update(position_params)
    redirect_to admin_path
  end

  def destroy
    @position.destroy
    redirect_to admin_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  private

  def set_position
    @position = Position.find(params[:id])
  end

  def set_worker
    @worker = Worker.find(params[:worker_id])
  end

  def strong_params
    params.require(:position).permit(:position_name, :worker, clients: [:name], company_attributes: [:id], site_attributes: [:name, :site_type, :start_date, :end_date, :amount, :money_unit, :photo])
  end

  def position_params
    strong_params.permit(:position_name)
  end
end
