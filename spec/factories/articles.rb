FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "Sample article #{n}" }
    content { "Sample content" }
    slug { "#{title.downcase.gsub(/[[:space:]]/, '-')}" }
  end
end
