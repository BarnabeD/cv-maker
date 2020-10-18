class Worker < ApplicationRecord
  has_many :positions
  has_many :graduates
  has_many :trainings
  has_many :sites, through: :positions
  
  validates :first_name, :last_name, :birth_date, :hire_date, :matricule, presence: true
end
