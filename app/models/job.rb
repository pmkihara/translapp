class Job < ApplicationRecord
  belongs_to :user
  belongs_to :translation_service

  STATUS = %w[accepted cancelled finished].freeze
  validates :status, inclusion: { in: STATUS }
end
