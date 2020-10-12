class RenameColumnTypeInTrainigsToTrainingType < ActiveRecord::Migration[6.0]
  def change
    rename_column :trainings, :type, :training_type
  end
end
