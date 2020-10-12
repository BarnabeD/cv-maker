class AddWorkerRefToGraduates < ActiveRecord::Migration[6.0]
  def change
    add_reference :graduates, :worker, null: false, foreign_key: true
  end
end
