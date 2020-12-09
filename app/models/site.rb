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
    pg_search_scope :search_by_site_name_andclient_name,
      against: :name,
      associated_against: {
        client: [:name]
      },
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

  def human_duration
    duration = calcul_duration_between_two_dates(self.start_date, self.end_date)
    years = duration[:years]
    months = duration[:months]
    array = []
    if years > 1
      array << "#{years} ans"
    elsif years == 1
      array << "#{years} an"
    end
    array << "#{months} mois" if months >= 1
    array.length > 1 ? array.join(', et ') : array.join('')
  end

  private

  def calcul_duration_between_two_dates(start_date, end_date)
    duration_in_second = (end_date - start_date).to_i
    ActiveSupport::Duration.build(duration_in_second * 24 * 3600).parts
  end
end
