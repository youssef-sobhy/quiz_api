class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :quiz, foreign_key: true
      t.float :score, null: false

      t.timestamps
    end
  end
end
