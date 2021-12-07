class Stay < ApplicationRecord
  belongs_to :unit
  belongs_to :resident

  validates :move_in, presence: true
  validate :move_in_before_move_out

  delegate :name, to: :resident

  def move_in_before_move_out
    return if move_in.blank? || move_out.blank?

    if move_out < move_in
      errors.add(:move_out, "must be after move in date")
    end
  end
end
