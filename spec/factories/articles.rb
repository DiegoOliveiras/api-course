FactoryBot.define do
  factory :article do
    sequence :title do |n|
       "Sample article #{n}"
    end
    content { "Sample content" }
    slug { "#{title.downcase.gsub(/[[:space:]]/, '-')}" }
  end
end
