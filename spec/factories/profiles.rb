FactoryGirl.define do
  factory :profile do
    sequence(:email) { |n| "john_#{n}@doe.com" }
    password 'password'
    password_confirmation 'password'
    association :state
    age { rand(16..90) }
    job_title 'Full Stack Developer'
  end
end
