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
    redirect_to admin_path notice: "Worker updated"
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
    # export
    # respond_to do |format|
    #    format.html
    #    format.pdf do
    #   #   html = WorkersController.render(
    #   # template: 'workers/showpdf',
    #   # layout: 'pdf',
    #   # assigns: { worker: @worker })
    #     html = format.html.render_to_string
    #     pdf = Grover.new(html).to_pdf
    #     send_data pdf, type: 'application/pdf', filename: "test.pdf"

    #    end
    #  end
  end

  # def pdf
  #   # set_worker
  #   @worker = Worker.find(export_params)
  #   # html = render 'workers/pdf'
  #   # pdf = Grover.new(html).to_pdf
  #   # # send_data pdf, type: 'application/pdf', filename: "test.pdf"
  #   # render layout: 'pdf'
  # end

  # def export
  #   # @worker = Worker.find(export_params)
  #   html_relative = WorkersController.render(
  #     template: 'workers/showpdf',
  #     layout: 'pdf',
  #     assigns: { worker: @worker }
  #   )
  #   base_url = "http://localhost:3000/"
  #   # html_absolute = Grover::HTMLPreprocessor.process html_relative, base_url, "http"
  #   html_absolute = 'http://localhost:3000/collaborateurs/1481'
  #   # raise
  #   pdf = Grover.new(html_absolute, {
  #                      # format: 'A4',
  #                      # display_url: base_url
  #                    }).to_pdf

  #   send_data pdf, type: 'application/pdf', filename: "test.pdf"
  # end

  private

  def set_worker
    @worker = Worker.includes(:graduates, :trainings, { positions: [:company, { site: [:client, { photo_attachment: :blob }] }] }).find(params[:id])
  end

  def worker_params
    params.require(:worker).permit(:first_name, :last_name, :birth_date, :hire_date, :photo, :matricule, position: [])
  end

  # def export_params
  #   params.require(:worker_id)
  # end
end
