5.times do
  Tweet.create({
    title: Faker::Book.title,
    body: Faker::Lorem.sentence
  })
end
