FactoryBot.define do
  factory :post do
    id { 1 }
    title { "MyString" }
    description { "MyText" }
    published { false }
    published_at { "2021-05-22 14:31:16" }
    author_id { 1 }
    created_at { "2021-05-22 14:31:16" }
    updated_at { "2021-05-22 14:31:16" }
    slug { "MyString" }
  end
end
