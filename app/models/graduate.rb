class Graduate < ApplicationRecord
  # attr_reader :department_list
  # attr_reader :french_departments
  belongs_to :worker
  validates :name, :speciality, :graduation_date, :school_name, :school_department, presence: true
  validates :name, uniqueness: true
  validate :graduation_date, :graduation_date_cannot_be_in_the_future
  validate :school_department, :department_must_be_included_in_list

  def self.french_departments
    self.new.department_list
  end

  def department_list
    department = ('1'..'95').to_a
    department.delete_at(19)
    department.insert(19, '2A','2B').push('971','972','973','974','976','Etranger')
  end

  private

  def department_must_be_included_in_list
    if school_department.present? && !department_list.include?(school_department)
      errors.add(:school_department, "must be in the department list")
    end
  end

  def graduation_date_cannot_be_in_the_future
    if graduation_date.present? && graduation_date > Date.today
      errors.add(:graduation_date, "can't be in the future")
    end
  end
end
