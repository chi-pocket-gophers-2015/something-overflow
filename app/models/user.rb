class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :comments, foreign_key: :author_id
  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :author_id
  has_many :votes, foreign_key: :author_id

  def question_from_answer(auth_id)
    Question.find_by_id(auth_id)
  end
end
