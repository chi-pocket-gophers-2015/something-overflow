get '/question/:id' do
  @question = Question.find_by_id(params[:id])
  erb :'questions/show'
end

post '/answer/:id' do
  #need to add in author_id and error handling
  answer = Answer.new(body: params[:body],
                      author_id: 1,
                      question_id: params[:id]
                     )
  answer.save
  redirect("/question/#{params[:id]}")
end
