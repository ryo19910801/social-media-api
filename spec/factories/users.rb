FactoryBot.define do
  factory :user do
    name { "hoge" }
    self_introduction { "よろしく" }
    website_url { "https://google.com" }

    trait :with_avatar do
      after(:build) do |user|
        user.avatar = fixture_file_upload(Rails.root.join('spec', 'files', 'avatar.png'), 'image/png')
      end
    end
  end
end