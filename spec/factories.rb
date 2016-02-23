FactoryGirl.define do

  # factory :merchant do
  #   name "Carl"
  # end

  factory :merchant do |u|
    u.sequence(:name) { |n| "Carl#{n}"}
  end

end
