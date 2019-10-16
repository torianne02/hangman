class SecretKeeper < ActiveRecord::Base
  belongs_to :guesser

  validates :word, presence: true
end 