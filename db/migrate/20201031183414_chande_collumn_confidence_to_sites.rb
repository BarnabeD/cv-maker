class ChandeCollumnConfidenceToSites < ActiveRecord::Migration[6.0]
  def change
    rename_column :sites, :confidencee, :confidence
    change_column :sites, :confidence, :string, default: 'confident'
  end
end
