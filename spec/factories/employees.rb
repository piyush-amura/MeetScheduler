FactoryGirl.define do
  factory :employee, class: 'User::Employee' do
    name  'piyushage'
    email 'piyushwwwgh13@gmail.com'
    password '1234567'
    password_confirmation '1234567'
    confirmed_at Time.now
    type 'User::Employee'
  end
end
