class Graduate < ApplicationRecord
  belongs_to :worker, optional: true
  validates :name, :speciality, :graduation_date, :school_name, :school_department, presence: true
end
