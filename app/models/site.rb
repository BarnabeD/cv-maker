class Site < ApplicationRecord
  belongs_to :client
  has_many :positions
end
