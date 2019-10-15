class CreateGuessers < ActiveRecord::Migration[6.0]
  def change
    create_table :guessers do |t|
      t.string :initials
    end
  end
end
