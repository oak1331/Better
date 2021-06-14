FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.sentence }
    time_slot_id { Faker::Number.between(from: 2, to: 10) }
    category_id { Faker::Number.between(from: 2, to: 9) }
    situation_id { Faker::Number.between(from: 2, to: 7) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    weather_id { Faker::Number.between(from: 2, to: 6) }
    association :user

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
