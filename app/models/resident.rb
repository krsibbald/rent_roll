class Resident < ApplicationRecord
  validates :name, presence: true
end
