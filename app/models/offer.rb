class Offer < ApplicationRecord
  has_one :job
  belongs_to :user

  STATUS = %w[available accepted concluded deleted].freeze
  validates :status, inclusion: { in: STATUS }
end
