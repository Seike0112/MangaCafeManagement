class Seat < ApplicationRecord
  belongs_to :booth, optional: true
end
