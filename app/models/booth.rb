class Booth < ApplicationRecord
  belongs_to :admin, optional: true
end
