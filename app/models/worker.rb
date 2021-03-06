class Worker < ApplicationRecord
  has_many :positions
  has_many :graduates
  has_many :trainings
  has_many :sites, through: :positions
  has_one_attached :photo, dependent: :destroy

  validates :first_name, :last_name, :birth_date, :hire_date, :matricule, presence: true
  validates :matricule, uniqueness: true

  def age_in_year
    calcul_duration_between_date_and_now(self.birth_date)[:years]
  end

  def hiring_time_in_year
    calcul_duration_between_date_and_now(self.hire_date)[:years]
  end

  def duration_since_last_graduate_in_years(graduates)
    if last_graduation_date(graduates)
      calcul_duration_between_date_and_now(last_graduation_date(graduates))[:years]
    else
      age_in_year - 18
    end
  end

  # PG-search:
  include PgSearch::Model
    pg_search_scope :search_by_fullname_and_matricule,
      against: [ :first_name, :last_name, :matricule ],
      using: {
        tsearch: { prefix: true } 
      }

  private

  def calcul_duration_between_date_and_now(date)
    duration_in_second = (Date.today - date).to_i
    ActiveSupport::Duration.build(duration_in_second * 24 * 3600).parts
  end

  def last_graduation_date(graduates)
    return false if graduates.blank?
    # Graduate.includes(:worker).where(worker: self).first.graduation_date
    # Worker.graduated.where(self).order(:graduation_date).first.graduation_date
    graduates.first.graduation_date
  end
end
