FactoryBot.define do
  factory :message do
    body { "Hello there!" }
    association :user
    association :conversation
  end
end
