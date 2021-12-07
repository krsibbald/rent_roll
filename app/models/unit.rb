class Unit < ApplicationRecord
  VALID_FLOOR_PLANS = %w[Studio Suite]

  has_many :stays

  validates :number, presence: true, uniqueness: true
  validates :floor_plan, presence: true, inclusion: VALID_FLOOR_PLANS
end
