class Guesser < ActiveRecord::Base
  has_secure_password 
  has_many :secret_keepers

  validates :initials, :password, presence: true
end 