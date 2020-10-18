class Company < ApplicationRecord
  has_many :positions
  has_many :sites, through: :positions
end
