class Order < ApplicationRecord
  belongs_to :user_id
  belongs_to :translation_service_id
end
