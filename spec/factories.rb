FactoryGirl.define do

  factory :merchant do |u|
    u.sequence(:name) { |n| "Carl#{n}"}
  end

  factory :item do
    name "Bucket"
    description "So good"
    unit_price "443.23"
  end

end
