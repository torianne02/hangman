class GuesserSerializer < ActiveModel::Serializer
  attributes :initials, :password

  has_many :secret_keepers
end