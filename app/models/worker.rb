class Worker < ApplicationRecord
  has_many :positions
  has_many :graduates
  has_many :trainings
end
