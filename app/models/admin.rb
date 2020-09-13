class Admin < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :ad_email, presence: true, format: { with: VALID_EMAIL_REGEX }

  validates :password, allow_blank: true, length: { minimum: 8 }
  has_secure_password

end
