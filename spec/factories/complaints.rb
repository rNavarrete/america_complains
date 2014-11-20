# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :complaint do
    product "MyString"
    sub_product "MyString"
    issue "MyString"
    sub_issue "MyString"
    state "MyString"
    zipcode 1
    date_submitted "MyString"
    company "MyString"
    consumer_disputed "MyString"
  end
end
