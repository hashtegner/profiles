FactoryGirl.define do
  factory :saved_query do
    association :profile
    sequence(:name) { |n| "Query #{n}" }
    parameters do
      {}
    end
  end
end
