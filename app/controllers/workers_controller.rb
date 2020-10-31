class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update, :destroy]

  def create
    @worker = Worker.new(worker_params)
    # @position = Position.new(params)
    if @worker.save
      redirect_to worker_path(@worker)
    else
      render :new
    end
  end

  # def destroy
  #   @worker.destroy
  #   redirect_to workers_path
  # end

  # def edit
  # end

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
    @age = calcul_duration_between_date_and_now(@worker.birth_date)[:years]
    @hiring_time = calcul_duration_between_date_and_now(@worker.hire_date)[:years]

    # experience since first graduate cans be with the last graduate with '.last' instead of '.first'
    if @worker.graduates.count > 0
      @last_graduate_date = @worker.graduates.order(:graduation_date).first.graduation_date
    else
      @last_graduate_date = nil
    end
    # @experience = calcul_duration_between_date_and_now(@last_graduate.graduation_date)[:years]
    # @site = Site.new
    # @sites = Site.all
    @worker_positions = Position.where(worker: @worker)
    @worker_graduates = Graduate.where(worker: @worker)
    @worker_trainings = Training.where(worker: @worker)
  end

  # def update
  #   @worker.update(worker_params)
  #   redirect_to worker_path(@worker)
  # end

  private

  def set_worker
    @worker = Worker.find(params[:id])
  end

  def calcul_duration_between_date_and_now(date)
    duration_in_second = (Date.today - date).to_i
    ActiveSupport::Duration.build(duration_in_second * 24 * 3600).parts
  end

  def worker_params
    params.require(:worker).permit(:first_name, :last_name, :birth_date, :hire_date, :photo, :matricule, position: [])
  end
end
