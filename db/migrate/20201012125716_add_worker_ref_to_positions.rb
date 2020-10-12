class AddWorkerRefToPositions < ActiveRecord::Migration[6.0]
  def change
    add_reference :positions, :worker, null: false, foreign_key: true
  end
end
