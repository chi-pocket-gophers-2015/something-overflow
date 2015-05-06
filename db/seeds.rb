new_user = User.create!(first_name: "Jim", last_name: "Joyce", username: "Lebron James", email: "jjoyce1@me.com", password_hash: "asdf")

new_commenter = User.create!(first_name: "Christian")
new_question = Question.create!(title:"How do you ride a bike?", body: "i dont know how.", author_id: new_user.id)
new_question = Question.create!(title:"Why do bad things happen to good people?", body: "I stubbed my toe and it hit me", author_id: new_user.id)

Question.create!(title:"Who let the dogs out?", body: "Batman?", author_id: new_commenter.id)
Question.create!(title:"What is love?", body: "dont hurt me", author_id: new_commenter.id)

Answer.create!(author_id: new_commenter.id, question_id: new_question.id, body:"bodybodybodybodybody")
Answer.create!(author_id: new_commenter.id, question_id: new_question.id, body:"DIFFERENT BODY WOOOOOO")

Answer.create!(author_id: new_user.id, question_id: new_question.id, body:"DIFFERENT BODY WOOOOOO")
Answer.create!(author_id: new_user.id, question_id: new_question.id, body:"bodybodybodybodybody")
