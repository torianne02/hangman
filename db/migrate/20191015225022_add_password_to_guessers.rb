class AddPasswordToGuessers < ActiveRecord::Migration[6.0]
  def change
    add_column :guessers, :password_digest, :string
  end
end
