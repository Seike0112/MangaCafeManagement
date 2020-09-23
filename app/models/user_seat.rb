class UserSeat < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :seat, optional: true
  belongs_to :his_user_seat, optional: true

end
