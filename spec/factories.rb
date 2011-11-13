FactoryGirl.define do
  factory :band do
    sequence(:username){ |n| "band#{n}" }
    sequence(:name){ |n| "Band#{n}" }
    sequence(:email){ |n| "band#{n}@example.com" }
    password 'password'
    password_confirmation {|u| u.password}
  end

  factory :admin_band, :parent => :band do
    admin true
  end

  factory :member do
    sequence(:name){ |n| "Member#{n}" }
    association :band
  end

  factory :setlist do
    sequence(:name){ |n| "Setlist#{n}" }
    association :band
  end

  factory :show do
    sequence(:name){ |n| "Show#{n}" }
    association :band
  end

  factory :song do
    sequence(:name){ |n| "Song#{n}" }
    association :band
  end
end