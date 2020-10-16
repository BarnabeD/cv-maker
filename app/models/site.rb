class Site < ApplicationRecord
  belongs_to :client
  has_many :positions

  validates :name, :site_type, :start_date, :end_date, :amount, :money_unit, presence: true

end
