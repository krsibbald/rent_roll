require 'rails_helper'

RSpec.describe Stay, :type => :model do
  describe 'start date before end date validation' do
    let(:early_date) { 1.year.ago.to_date }
    let(:late_date) { 1.day.ago.to_date }
    it "move_in before move_out" do
      expect(FactoryBot.build(:stay, move_in: early_date, move_out: late_date)).to be_valid
    end
    it "no move_out" do
      expect(FactoryBot.build(:stay, move_in: early_date, move_out: nil)).to be_valid
    end
    it "move_in after move_out" do
      expect(FactoryBot.build(:stay, move_in: late_date, move_out: early_date)).to_not be_valid
    end
  end
end
