FactoryBot.define do
  factory :comment do
    user
    tweet
    body { 'body is mandatory' }
  end
end
