class ChangeAmountTypeInSites < ActiveRecord::Migration[6.0]
  def change
    change_column :sites, :amount, :float
  end
end
