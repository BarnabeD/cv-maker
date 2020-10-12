class ChangeColumnNameInWorkers < ActiveRecord::Migration[6.0]
  def change
    rename_column :workers, :date_of_birth, :birth_date
    rename_column :workers, :date_of_hire, :hire_date
  end
end
