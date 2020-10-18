class Position < ApplicationRecord
  belongs_to :site, inverse_of: :positions
  belongs_to :company
  belongs_to :worker
  has_many :sites, through: :positions

  # accepts_nested_attributes_for :site, :client
end
