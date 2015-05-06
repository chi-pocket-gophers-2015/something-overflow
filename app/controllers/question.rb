get '/question/:id' do
  @question = Question.find_by_id(params[:id])
  erb :'questions/show'
end
