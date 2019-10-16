class Message
  def self.not_found(record = 'record')
    'Sorry, #{record} not found'
  end 

  def self.account_created
    'Account created successfully'
  end 

  def self.account_not_created
    'Account could not be created'
  end
end 