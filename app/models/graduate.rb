class Graduate < ApplicationRecord
  belongs_to :worker, optional: true
  validates :name, :speciality, :graduation_date, :school_name, :school_department, presence: true

  def self.french_departments
    department = ('1'..'95').to_a
    department.delete_at(19)
    department.insert(19, '2A','2B').push('971','972','973','974','976','Etranger')
  end
end
