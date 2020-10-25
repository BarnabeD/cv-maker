class ChangeColumnSchoolDepartmentInGraduates < ActiveRecord::Migration[6.0]
  def change
    change_column :graduates, :school_department, :string
  end
end
