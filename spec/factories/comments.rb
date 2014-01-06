# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    title "MyString"
    commenter "MyString"
    body "MyText"
    association :post
  end
end
