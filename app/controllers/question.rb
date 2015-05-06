get '/question/:id' do
  @question = Question.find_by_id(params[:id])
  @comments = Comment.all
  @answer = Answer.all
  erb :'questions/show'
end
