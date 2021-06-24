FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    name                  { Faker::Name.last_name }
    email                 { Faker::Internet.free_email }
    password              { 'ss11111' }
    password_confirmation { 'ss11111' }
    image { File.open(File.join(Rails.root, 'spec/test_gazou/test_gazou01.jpg')) }
  end
end
