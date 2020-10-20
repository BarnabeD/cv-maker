class Graduate < ApplicationRecord
  belongs_to :worker, optional: true
end
