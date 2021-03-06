class Offer < ApplicationRecord
  has_one :job, dependent: :destroy
  belongs_to :user

  STATUS = %w[available accepted concluded deleted].freeze
  validates :status, inclusion: { in: STATUS }
  validates :remote, inclusion: { in: [true, false] }
  validates :user, :original_language, :final_language, :price_per_hour, :service_hours, :date, presence: true
  validates :location, presence: true, if: -> { :remote == true }
  include PgSearch::Model
  pg_search_scope :search_by_location_and_language,
                  against: %i[location original_language final_language],
                  using: {
                    tsearch: { prefix: true }
                  }
end
