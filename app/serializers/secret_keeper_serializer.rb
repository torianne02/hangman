class SecretKeeperSerializer < ActiveModel::Serializer
  attributes :word, :guesses

  belongs_to :guesser
end