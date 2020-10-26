class Worker < ApplicationRecord
  has_many :positions
  has_many :graduates
  has_many :trainings
  has_many :sites, through: :positions
  has_one_attached :photo

  validates :first_name, :last_name, :birth_date, :hire_date, :matricule, presence: true
  validates :matricule, uniqueness: true
end
