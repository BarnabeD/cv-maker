class Site < ApplicationRecord
  belongs_to :client
  has_many :positions
  has_many :workers, through: :positions, dependent: :destroy
  has_one_attached :photo
  # accepts_nested_attributes_for :positions, :client

  validates :name, :site_type, :start_date, :end_date, :amount, :money_unit, presence: true
  validates :site_type, inclusion: { in: ['Marché unique', 'Marché à bon de commande', 'Accord cadre']}
  validates :money_unit, inclusion: { in: ['€', 'K€', 'M€', 'Mrd€']}

  # PG-search:
  include PgSearch::Model
    pg_search_scope :search_by_site_name,
      against: :name,
      using: {
        tsearch: { prefix: true } 
      }

  def is_confident?
    self.confidence == 'confident' ? true : false
  end

  def is_not_sure?
    self.confidence == 'not sure' ? true : false
  end

  def is_not_nonfident?
    self.confidence == 'false' ? true : false
  end

end
