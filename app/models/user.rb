class User < ApplicationRecord
  has_secure_token :auth_token
  has_one_attached :avatar

  validates :name, presence: true
end
