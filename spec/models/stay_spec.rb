require 'rails_helper'

RSpec.describe Stay, :type => :model do
  let(:early_date) { 1.year.ago.to_date }
  let(:late_date) { 1.day.ago.to_date }
  let(:today) { Date.today.to_date }

  describe 'start date before end date validation' do
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

  describe 'move_out_after scope' do
    let!(:past_stay) { FactoryBot.create(:stay, :past)}
    let!(:current_stay) { FactoryBot.create(:stay, :present)}
    let!(:future_stay) { FactoryBot.create(:stay, :future)}

    it do
      expect(Stay.move_out_after(today)).to_not include(past_stay)
      expect(Stay.move_out_after(today)).to include(current_stay)
      expect(Stay.move_out_after(today)).to include(future_stay)
    end
  end

  describe '#status_on(date)' do
    it "past" do
      expect(FactoryBot.create(:stay, :past).status_on(today)).to eq 'Past'
    end
    it "present" do
      expect(FactoryBot.create(:stay, :present).status_on(today)).to eq 'Current'
    end
    it "future" do
      expect(FactoryBot.create(:stay, :future).status_on(today)).to eq 'Future'
    end
  end
end
