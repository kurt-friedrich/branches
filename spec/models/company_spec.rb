require 'rails_helper'

RSpec.describe Company, type: :model do
  # name
  context 'when less than two characters' do
    let(:company) { FactoryBot.build(:company, name: 'A') }

    it 'is not valid' do
      expect(company).not_to be_valid
    end
  end

  # plan_level
  it { should_not allow_value(SecureRandom.hex).for(:plan_level) }
  it { should allow_value('legacy').for(:plan_level) }
  it { should allow_value('custom').for(:plan_level) }
  it { should allow_value('basic').for(:plan_level) }
  it { should allow_value('plus').for(:plan_level) }
  it { should allow_value('growth').for(:plan_level) }
  it { should allow_value('enterprise').for(:plan_level) }
end
