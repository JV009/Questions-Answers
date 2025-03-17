class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.string :body, null: false

      t.timestamps
    end
  end

  def down
    drop_table :questions
  end
end
