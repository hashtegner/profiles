FactoryGirl.define do
  factory :profile do
    sequence(:email) { |n| "john_#{n}@doe.com" }
    password 'password'
    password_confirmation 'password'
    association :state
    age { rand(16..90) }
    title_position 'Full Stack Developer'
  end
end
