class AddCollumnConfidenceToWorkers < ActiveRecord::Migration[6.0]
  def change
    add_column :workers, :confidencee, :string, default: 'confident'
  end
end
