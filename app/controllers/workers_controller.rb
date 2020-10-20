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
    redirect_to workers_path
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
    @worker = set_worker
    @age = set_duration(@worker.birth_date)[:years]
    @hiring_time = set_duration(@worker.hire_date)[:years]

    # experience since first graduate cans be with the last graduate with '.last' instead of '.first'
    if @worker.graduates.count > 0
      @last_graduate_date = @worker.graduates.order(:graduation_date).first.graduation_date
    else
      @last_graduate_date = nil
    end
    # @experience = set_duration(@last_graduate.graduation_date)[:years]
    @site = Site.new
    @sites = Site.all
    @positions = Position.where(worker: @worker)
    @graduates = Graduate.where(worker: @worker)
  end

  def update
    @worker.update(worker_params)
    redirect_to worker_path(@worker)
  end

  private

  def set_worker
    @worker = Worker.find(params[:id])
  end

  def set_duration(date)
    duration_in_second = (Date.today - date).to_i
    duration = ActiveSupport::Duration.build(duration_in_second * 24 * 3600).parts
  end

  def worker_params
    params.require(:worker).permit(:first_name, :last_name, :birth_date, :hire_date, :matricule)
  end
end
