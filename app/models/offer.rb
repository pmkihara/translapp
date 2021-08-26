class Offer < ApplicationRecord
  has_one :job
  belongs_to :user

  STATUS = %w[available accepted concluded deleted].freeze
  validates :status, inclusion: { in: STATUS }

  validates :remote, inclusion: { in: [true, false] }
  validates :user, :original_language, :final_language, :price_per_hour, :service_hours, :date, presence: true
  validates :location, presence: true, if: -> { :remote == true }
end
