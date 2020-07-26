FactoryBot.define do
  factory :tweet do
    user
    title { 'Title needs to be present ' }
    body { 'bodybody' }
  end
end
