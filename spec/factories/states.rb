FactoryGirl.define do
  factory :state do
    sequence :name do |n|
      "Santa Catarina #{n}"
    end
  end
end
