class Company < ApplicationRecord
  has_many :positions
  # accepts_nested_attributes_for :company
  validates :name, uniqueness: true, presence: true
  validates :city, presence: true

  include PgSearch::Model
    pg_search_scope :search_by_company_name_and_city,
      against: [ :name, :city ],
      using: {
        tsearch: { prefix: true }
      }
end
