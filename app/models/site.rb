class Site < ApplicationRecord
  belongs_to :client
  has_many :positions
  has_many :workers, through: :positions, dependent: :destroy
  # accepts_nested_attributes_for :positions, :client

  validates :name, :site_type, :start_date, :end_date, :amount, :money_unit, presence: true
  validates :site_type, inclusion: { in: ['Marché unique', 'Marché à bon de commande', 'Accord cadre']}
  validates :money_unit, inclusion: { in: ['€', 'K€', 'M€', 'Mrd€']}

end
