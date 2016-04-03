FactoryGirl.define do
  factory :saved_query do
    association :profile
    sequence(:name) { |n| "Query #{n}" }
    parameters({match: :all}.to_param)
  end
end
