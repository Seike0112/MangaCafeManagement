class Owner < ApplicationRecord

  validates :password, allow_blank: true, length: { minimum: 8 }
  has_secure_password

end
