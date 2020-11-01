class Worker < ApplicationRecord
  has_many :positions
  has_many :graduates
  has_many :trainings
  has_many :sites, through: :positions
  has_one_attached :photo

  validates :first_name, :last_name, :birth_date, :hire_date, :matricule, presence: true
  validates :matricule, uniqueness: true

  def age_in_year
    calcul_duration_between_date_and_now(self.birth_date)[:years]
  end

  def hiring_time_in_year
    calcul_duration_between_date_and_now(self.hire_date)[:years]
  end

  def duration_since_last_graduate_in_years
    if last_graduation_date
      calcul_duration_between_date_and_now(last_graduation_date)[:years]
    else
      age_in_year - 18
    end
  end

  private

  def calcul_duration_between_date_and_now(date)
    duration_in_second = (Date.today - date).to_i
    ActiveSupport::Duration.build(duration_in_second * 24 * 3600).parts
  end

  def last_graduation_date
    return false if self.graduates.blank?
    self.graduates.order(:graduation_date).first.graduation_date
  end
end
