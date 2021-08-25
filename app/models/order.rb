class Order < ApplicationRecord
  belongs_to :user
  belongs_to :translation_service

  STATUS = %w[active canceled done].freeze
  validates :status, inclusion: { in: STATUS }
end
