require 'rails_helper'

RSpec.describe Lesson, type: :model do
  # name
  it { should validate_presence_of(:name) }

  # company
  it { should belong_to(:company) }
end
