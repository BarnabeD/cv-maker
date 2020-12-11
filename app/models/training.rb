class Training < ApplicationRecord
  belongs_to :worker

  validates :name, :date, :training_type, presence: true
  validate :date_cannot_be_in_the_future
  validates :training_type, inclusion:
    {
      in: ['Sécurité', 'Professionnelle'],
      message: "%{value} is not a valid training_type"
    }

  private

  def date_cannot_be_in_the_future
    if date.present? && date > Date.today
      errors.add( :date, "can't be in the future")
    end
  end
end
