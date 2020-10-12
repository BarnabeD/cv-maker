class Worker < ApplicationRecord
  has_many :positions
  has_many :graduates
  has_many :trainings
  has_many :sites, through: positions
end
