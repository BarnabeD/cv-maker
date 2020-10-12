class AddSiteRefToPositions < ActiveRecord::Migration[6.0]
  def change
    add_reference :positions, :site, null: false, foreign_key: true
  end
end
