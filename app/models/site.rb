class Site < ApplicationRecord
  belongs_to :client
  has_many :positions, inverse_of: :site
  has_many :workers, through: :positions
  has_many :companies, through: :positions
  accepts_nested_attributes_for :positions, :client, :companies
end
