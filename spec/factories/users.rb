FactoryGirl.define do
  factory :user do
    name 'piyush'
    email 'piyush22@gmail.com'
    password '1234567'
    password_confirmation '1234567'
    confirmed_at Time.now
    type 'User::Admin'
  end
end
