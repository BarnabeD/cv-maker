class DropSecurityTrainingTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :security_trainings
  end
end
