FactoryGirl.define do 
  factory :user do 
    email { Faker::Internet.email }
    password 'foobar'
    password_confirmation 'foobar'

    factory :admin, parent: :user do 
      email 'bryan.lackey@gmail.com'
      admin true
    end
  end
end
