class CreateSites < ActiveRecord::Migration[6.0]
  def change
    create_table :sites do |t|
      t.text :name
      t.string :type
      t.date :start_date
      t.date :end_date
      t.integer :amount
      t.string :money_unit

      t.timestamps
    end
  end
end
