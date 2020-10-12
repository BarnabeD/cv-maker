class CreateProfessionalTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :professional_trainings do |t|
      t.string :name
      t.date :date

      t.timestamps
    end
  end
end
