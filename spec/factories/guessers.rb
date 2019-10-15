FactoryBot.define do 
  factory :guesser do 
    initials { Faker::Name.initials(number: 3) }
  end 
end 