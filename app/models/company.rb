class Company < ApplicationRecord
  validates :name, presence: true,
                   length: { minimum: 2 }

  validates :plan_level, inclusion: { in: %w(legacy custom basic plus growth
                                             enterprise) }
end
