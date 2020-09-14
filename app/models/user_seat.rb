class UserSeat < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :seat, optional: true

end
