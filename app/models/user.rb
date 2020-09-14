class User < ApplicationRecord

  belongs_to :admin, optional: true
  has_many :user_seats

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :us_email, presence: true, format: { with: VALID_EMAIL_REGEX }

  validates :password, allow_blank: true, length: { minimum: 8 }
  has_secure_password

end
