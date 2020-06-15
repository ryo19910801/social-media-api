class User < ApplicationRecord
  has_secure_token :auth_token
  has_one_attached :avatar

  validates :name, presence: true, length: { maximum: 255 }
  validates :self_introduction, length: { maximum: 255 }
  validates :website_url, length: { maximum: 255 }
end
