FactoryBot.define do
  factory :lesson do
    name 'How To Drink La Croix'

    association(:company)
  end
end
