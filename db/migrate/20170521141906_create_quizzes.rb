class CreateQuizzes < ActiveRecord::Migration[5.0]
  def change
    create_table :quizzes do |t|
      t.string :title
      t.integer :passing_score
      t.belongs_to :topic, foreign_key: true

      t.timestamps
    end
  end
end
