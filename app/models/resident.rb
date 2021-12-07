class Resident < ApplicationRecord
  has_many :stays
  
  validates :name, presence: true
end
