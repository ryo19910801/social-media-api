FactoryBot.define do
  factory :user do
    name { "hoge" }
    self_introduction { "よろしく" }
    website_url { "https://google.com" }
  end
end