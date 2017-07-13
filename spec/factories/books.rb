FactoryGirl.define do
  factory :book do
    title { Faker::Book.title }
    description {Faker::Lorem.sentences(5) }
    cover_url {Faker::Internet.url }
  end
end