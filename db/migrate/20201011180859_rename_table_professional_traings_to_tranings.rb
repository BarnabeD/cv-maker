class RenameTableProfessionalTraingsToTranings < ActiveRecord::Migration[6.0]
  def change
    rename_table :professional_trainings, :trainings
  end
end
