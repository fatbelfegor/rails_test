FactoryGirl.define do
  factory :book do
    title { Faker::Book.title }
    description {Faker::Lorem.sentence(8) }
    cover_url {Faker::Internet.url }
  end
end
