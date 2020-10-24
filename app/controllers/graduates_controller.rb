class GraduatessController < ApplicationController

  def create
    @worker = set_worker
    @graduate = Graduate.new(strong_params)
    # company = Company.find(strong_params[:company_attributes][:id])
    # @position.create_site(strong_params[:site_attributes])
    # @position.company = company
    # @position.site.create_client(strong_params[:clients])
    # @position.worker = @worker

    if @graduate.save
      redirect_to worker_path(@worker)
    else
      render '_new'
    end
  end

  def new
    # @worker = set_worker
    # @graduate = Graduate.new
    # @french_department = [3,4]

    # @position.build_company
    # @position.build_site
  end


  private

  def set_worker
    @worker = Worker.find(params[:worker_id])
  end

  def strong_params
    params.require(:position).permit(:position_name, :worker, clients: [:name], company_attributes: [:id], site_attributes: [:name, :site_type, :start_date, :end_date, :amount, :money_unit])
  end

  # def position_params
  #   strong_params.permit(:position_name)
  # end
end
