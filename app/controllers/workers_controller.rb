class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update, :destroy]

  def create
    @worker = Worker.new(worker_params)
    if @worker.save
      redirect_to worker_path(@worker)
    else
      render :new
    end
  end

  def destroy
    @worker.destroy
    redirect_to admin_path
  end

  def edit
  end

  def index
    @workers = Worker.all
  end

  def new
    @worker = Worker.new
  end

  def show
    @position = Position.new
    @graduate = Graduate.new
    @position.build_company
    @position.build_site
  end

  private

  def set_worker
    @worker = Worker.find(params[:id])
  end

  def worker_params
    params.require(:worker).permit(:first_name, :last_name, :birth_date, :hire_date, :photo, :matricule, position: [])
  end
end
