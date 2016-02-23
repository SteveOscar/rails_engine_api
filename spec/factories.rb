FactoryGirl.define do

  factory :merchant do |u|
    u.sequence(:name) { |n| "Carl#{n}"}
    created_at DateTime.parse("2012-03-27T14:54:05.000Z")
    updated_at DateTime.parse("2012-03-27T14:54:05.000Z")
  end

  factory :item do
    name "Bucket"
    description "So good"
    unit_price "443.23"
  end

end
