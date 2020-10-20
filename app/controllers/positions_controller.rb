class PositionsController < ApplicationController

  def index
    @positions.where(worker: set_worker)
  end

  private

  def set_worker
    @worker = Worker.find(params[:id])
  end
end
