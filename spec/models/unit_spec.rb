require 'rails_helper'

RSpec.describe Unit, :type => :model do
  describe "number validations" do
    it 'invalid unless unique' do
      first_unit = FactoryBot.create(:unit, number: 3)
      expect(first_unit).to be_valid

      same_number_unit = FactoryBot.build(:unit, number: 3)
      expect(same_number_unit).to_not be_valid
      expect(same_number_unit.errors.messages[:number]).to include 'has already been taken'
    end
  end

  describe 'floor_plan validations' do
    it "allows VALID_FLOOR_PLANS type" do
      expect(FactoryBot.build(:unit, floor_plan: Unit::VALID_FLOOR_PLANS.first)).to be_valid
    end
    it "invalid with other floor_plan type" do
      expect(FactoryBot.build(:unit, floor_plan: 'hallway')).to_not be_valid
    end
  end
end
