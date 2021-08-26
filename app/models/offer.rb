class Offer < ApplicationRecord
  has_one :job
  belongs_to :user

  STATUS = %w[available accepted concluded deleted].freeze
  validates :status, inclusion: { in: STATUS }
  include PgSearch::Model
  pg_search_scope :search_by_location_and_language,
    against: [ :location, :original_language, :final_language ],
    using: {
      tsearch: { prefix: true }
    }
end
