class Site < ApplicationRecord
  belongs_to :client
  has_many :positions, dependent: :destroy
  has_many :workers, through: :positions
  has_one_attached :photo, dependent: :destroy
  # accepts_nested_attributes_for :positions, :client

  validates :name, :site_type, :start_date, :end_date, :amount, :money_unit, presence: true
  validates :site_type, inclusion: { in: ['Marché unique', 'Marché à bon de commande', 'Accord cadre'] }
  validates :money_unit, inclusion: { in: ['€', 'K€', 'M€', 'Mrd€'] }
  validate :start_date_cannot_be_in_the_future, :start_date_cannot_be_iafter_end_date

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

  def confident?
    confidence == 'confident'
  end

  def not_sure?
    confidence == 'not sure'
  end

  def not_confident?
    confidence == 'not confident'
  end

  def human_duration
    duration = calcul_duration_between_two_dates(start_date, end_date)
    years = duration[:years]
    months = duration[:months]
    array = []
    if years > 1
      array << "#{years} ans"
    elsif years == 1
      array << "#{years} an"
    end
    array << "#{months} mois" if months >= 1
    array.length > 1 ? array.join(', et ') : array.join
  end

  private

  def start_date_cannot_be_in_the_future
    errors.add(:start_date, "can't be in the future") if start_date.present? && start_date > Time.zone.today
  end

  def start_date_cannot_be_iafter_end_date
    if start_date.present? && end_date.present? && start_date > end_date
      errors.add(:start_date, "can't be in the future")
    end
  end

  def calcul_duration_between_two_dates(start_date, end_date)
    duration_in_second = (end_date - start_date).to_i
    ActiveSupport::Duration.build(duration_in_second * 24 * 3600).parts
  end
end
