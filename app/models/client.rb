class Client < ApplicationRecord
  has_many :sites, dependent: :destroy
  validates :name, presence: true
end
