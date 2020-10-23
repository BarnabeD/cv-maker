class Position < ApplicationRecord
  belongs_to :site
  belongs_to :company
  belongs_to :worker
  has_one :client

  accepts_nested_attributes_for :company, :site
end
