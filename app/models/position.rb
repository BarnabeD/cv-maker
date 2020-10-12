class Position < ApplicationRecord
  belongs_to :site
  belongs_to :company
  belongs_to :worker
end
