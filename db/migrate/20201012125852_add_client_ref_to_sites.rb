class AddClientRefToSites < ActiveRecord::Migration[6.0]
  def change
    add_reference :sites, :client, null: false, foreign_key: true
  end
end
