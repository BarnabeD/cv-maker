class GraduatesController < ApplicationController
  def create
    @graduate = Graduate.new(graduate_params)
    @graduate.worker = set_worker
    if @graduate.save
      redirect_to worker_path(@worker)
    else
      render '_new'
    end
  end

  private

  def set_worker
    @worker = Worker.find(params[:worker_id])
  end

  def graduate_params
    params.require(:graduate).permit(:name, :speciality, :school_name, :school_department, :graduation_date)
  end
end
