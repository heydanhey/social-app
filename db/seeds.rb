100.times do
  Post.create!(
    user_id: Faker::Number.between(1, 20),
    text: Faker::Hipster.sentence,
    emotion_id: Faker::Number.between(1, 4),
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.latitude
    )
end
