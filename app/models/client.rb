class Client < ApplicationRecord
  has_many :sites, dependent: :destroy
  has_many :positions, through: :site

  validates :name, presence: true
end
