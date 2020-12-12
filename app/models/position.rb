class Position < ApplicationRecord
  belongs_to :site
  belongs_to :company
  belongs_to :worker
  has_one :client, through: :site

  accepts_nested_attributes_for :company, :site
  validates_associated :company
  validates :position_name, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_site_name_worker_full_mane_position_name,
                  against: :position_name,
                  associated_against: {
                    site: [:name],
                    worker: [:first_name, :last_name],
                    client: [:name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
