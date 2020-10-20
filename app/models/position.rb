class Position < ApplicationRecord
  belongs_to :site, inverse_of: :positions
  belongs_to :company
  belongs_to :worker

  accepts_nested_attributes_for :company
end
