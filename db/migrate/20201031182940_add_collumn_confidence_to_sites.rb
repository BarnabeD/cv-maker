class AddCollumnConfidenceToSites < ActiveRecord::Migration[6.0]
  def change
    revert AddCollumnConfidenceToWorkers

    add_column :sites, :confidencee, :string, default: 'confident'
  end
end
