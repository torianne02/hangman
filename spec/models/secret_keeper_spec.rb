require 'rails_helper'

RSpec.describe SecretKeeper, type: :model do
  # association test
  it { should belong_to(:guesser) }
end 