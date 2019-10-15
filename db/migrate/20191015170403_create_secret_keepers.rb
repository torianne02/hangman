class CreateSecretKeepers < ActiveRecord::Migration[6.0]
  def change
    create_table :secret_keepers do |t|
      t.integer :guesser_id
      t.string :word
      t.text :guesses, array: true, default: []
    end
  end
end
