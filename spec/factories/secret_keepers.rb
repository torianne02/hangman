FactoryBot.define do
  factory :secret_keeper do 
    word { Faker::Creature::Animal.name }
  end 
end 