class RenameColumnNameInPositionsToPositionName < ActiveRecord::Migration[6.0]
  def change
    rename_column :positions, :name, :position_name
  end
end
