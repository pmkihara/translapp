class Order < ApplicationRecord
  belongs_to :user
  belongs_to :translation_service
end
