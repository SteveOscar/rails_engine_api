FactoryGirl.define do

  factory :merchant do |u|
    u.sequence(:name) { |n| "Carl#{n}"}
    created_at DateTime.parse("2012-03-27T14:54:05.000Z")
    updated_at DateTime.parse("2012-03-27T14:54:05.000Z")
  end

  factory :item do |u|
    u.sequence(:name) { |n| "Bucket#{n}"}
    description "So good"
    unit_price "443.23"
    merchant_id "1"
    created_at DateTime.parse("2012-03-27T14:54:05.000Z")
    updated_at DateTime.parse("2012-03-27T14:54:05.000Z")
  end

  factory :customer do |u|
    u.sequence(:first_name) { |n| "Shake#{n}"}
    u.sequence(:last_name) { |n| "Man#{n}"}
    created_at DateTime.parse("2012-03-27T14:54:05.000Z")
    updated_at DateTime.parse("2012-03-27T14:54:05.000Z")
  end

  factory :invoice do |u|
    created_at DateTime.parse("2012-03-27T14:54:05.000Z")
    updated_at DateTime.parse("2012-03-27T14:54:05.000Z")
  end

  factory :invoice_item do |u|
    item_id "1"
    invoice_id "1"
    unit_price "439.43"
    quantity "2"
    created_at DateTime.parse("2012-03-27T14:54:05.000Z")
    updated_at DateTime.parse("2012-03-27T14:54:05.000Z")
  end

  factory :transaction do |u|
    invoice_id "1"
    credit_card_number "384945849023"
    result "success"
    created_at "2012-03-27 14:54:05 UTC"
    updated_at "2012-03-27 14:54:05 UTC"
  end

end
