class Site < ApplicationRecord
  belongs_to :client
  has_many :positions
  has_many :workers, through: :positions, dependent: :destroy
  # accepts_nested_attributes_for :positions, :client

  validates :name, :site_type, :start_date, :end_date, :amount, :money_unit, presence: true

end
