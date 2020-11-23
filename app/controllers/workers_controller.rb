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

  def update
    @worker.update(worker_params)
    redirect_to admin_path
  end

  def index
    @workers = Worker.all.includes(positions: :company, photo_attachment: :blob)
  end

  def new
    @worker = Worker.new
  end

  def show
    @position = Position.new
    @graduate = Graduate.new
    @position.build_company
    @position.build_site
    respond_to do |format|
          format.html { render :show }
          format.pdf do
            pdf = CurriculumWorkerClassic.new(@worker,view_context)
            send_data pdf.render,
              filename: "CV - #{@worker.last_name.upcase} #{@worker.first_name.capitalize}.pdf",
              type: 'application/pdf',
              disposition: 'inline' #debug
              # disposition: 'attachement' #normal comportment
          end
        end
  end

  private

  def set_worker
    @worker = Worker.includes(:graduates, :trainings, {positions: [:company, {site: [:client, photo_attachment: :blob] } ]}).find(params[:id])
  end

  def worker_params
    params.require(:worker).permit(:first_name, :last_name, :birth_date, :hire_date, :photo, :matricule, position: [])
  end
end
