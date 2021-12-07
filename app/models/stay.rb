class Stay < ApplicationRecord
  belongs_to :unit
  belongs_to :resident

  validates :move_in, presence: true
  validate :move_in_before_move_out

  delegate :name, to: :resident

  scope :move_out_after, ->(date) { where('move_out > ?', date) }

  def status_on(date)
    return "Future" if move_in > date
    return "Current" if move_out.nil?
    return "Past" if move_out < date
    "Current"
  end

  private
  def move_in_before_move_out
    return if move_in.blank? || move_out.blank?

    if move_out < move_in
      errors.add(:move_out, "must be after move in date")
    end
  end
end
