class AddTypeToTrainings < ActiveRecord::Migration[6.0]
  def change
    add_column :trainings, :type, :string
  end
end
