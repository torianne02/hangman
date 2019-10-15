require 'rails_helper'

RSpec.describe Guesser, type: :model do
  # association test
  it { should have_many(:secret_keepers) }

  # validation test
  it { should validate_presence_of(:initials) }
  it { should validate_presence_of(:password) }
end 