class Stay < ApplicationRecord
  belongs_to :unit
  belongs_to :resident
end
