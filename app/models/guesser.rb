class Guesser < ActiveRecord::Base
  has_many :secret_keepers

  validates :initials, presence: true
end 