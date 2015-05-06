# new_user = User.create!(first_name: "Jim", username:jimjoyce, password: ??)

# new_commenter = User.create!(first_name: "Christian")

# new_question = Question.create!(author_id: new_user.id)

# new_answer = Answer.create!(author_id: new_commenter.id, question_id: new_question.id)

# new_comment = new_answer.comments.create!(author_id: new_user.id)

# new_vote = new_answer.votes.create!(value: 1, author_id: new_user.id)

# another_vote = new_question.votes.create!(value: -1, author_id: new_commenter.id)

# new_question.comments.create!(author_id: new_commenter.id)

