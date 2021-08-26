class Job < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  STATUS = %w[accepted cancelled finished].freeze
  validates :status, inclusion: { in: STATUS }
  validates :user, :offer, :date, :final_cost, presence: true
end
