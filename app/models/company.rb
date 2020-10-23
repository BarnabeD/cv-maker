class Company < ApplicationRecord
  has_many :positions
  # accepts_nested_attributes_for :company
  validates :name, :city, presence: true
end
