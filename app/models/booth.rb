class Booth < ApplicationRecord
  belongs_to :admin, optional: true
  has_many :seats
  has_many :user_seats, dependent: :destroy
end
