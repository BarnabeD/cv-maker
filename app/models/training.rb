class Training < ApplicationRecord
  belongs_to :worker

  validates :name, :date, :training_type, presence: true
end
