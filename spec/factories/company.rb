FactoryBot.define do
  factory :company do
    name 'Cinco Corporation'
    trial_status { Date.today + 2.weeks }
    plan_level { ['legacy', 'custom', 'basic', 'plus', 'growth', 'enterprise'] }
  end
end
