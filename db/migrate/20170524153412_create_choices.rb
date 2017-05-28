class CreateChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :choices do |t|
      t.string :choice, null: false
      t.boolean :right_choice, null: false, default: false
      t.belongs_to :question, foreign_key: true

      t.timestamps
    end
  end
end
