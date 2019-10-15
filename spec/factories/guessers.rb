FactoryBot.define do 
  factory :guesser do 
    initials { Faker::Name.initials(number: 3) }
    password { Faker::Internet.password(min_length: 8, max_length: 16, mix_case: true) }
  end 
end 