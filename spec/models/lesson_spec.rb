require 'rails_helper'

RSpec.describe Lesson, type: :model do
  let(:subject) { FactoryBot.build(:lesson) }

  # name
  it { should validate_presence_of(:name) }
  it { should allow_value('Lesson').for(:name) }
  it { should allow_value('Lesson1').for(:name) }
  it { should allow_value('Lesson 1').for(:name) }
  it { should_not allow_value('Le$$on').for(:name) }

  # company
  it { should belong_to(:company) }
end
