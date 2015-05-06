class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.belongs_to :author
      t.integer :best_answer_id
      t.timestamps null: false
    end
  end
end
