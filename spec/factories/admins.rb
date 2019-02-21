FactoryBot.define do
  factory :admin do
    sequence(:email) { |i| "admin#{i}@example.org" }
    password { 'Some!passWord' }
  end
end
