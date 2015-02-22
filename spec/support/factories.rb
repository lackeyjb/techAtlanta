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

  factory :article do 
    source { Faker::Internet.url }
    summary { Faker::Lorem.paragraph }
  end

  factory :favorite do 
    article_id 1
    user_id 1
  end
end
