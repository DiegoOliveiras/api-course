FactoryBot.define do
  factory :access_token do
    sequence(:token) { |n| "accesstoken#{n}" }
    user nil
  end
end
