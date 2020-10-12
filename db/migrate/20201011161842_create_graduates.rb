class CreateGraduates < ActiveRecord::Migration[6.0]
  def change
    create_table :graduates do |t|
      t.string :name
      t.string :speciality
      t.string :school_name
      t.integer :school_department
      t.date :graduation_date

      t.timestamps
    end
  end
end
