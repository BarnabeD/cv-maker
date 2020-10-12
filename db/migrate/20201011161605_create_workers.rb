class CreateWorkers < ActiveRecord::Migration[6.0]
  def change
    create_table :workers do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.date :date_of_hire
      t.integer :matricule

      t.timestamps
    end
  end
end
