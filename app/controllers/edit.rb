get '/comments/edit/:id' do
  "Hello World"
end

get '/questions/edit/:id' do


  #refactor to remove instance variable assignment
  @question = Question.find(params[:id])
  @path = "/questions/edit/#{params[:id]}"
  @method = "post"

  # user auth
  redirect("/questions/#{params[:id]}") unless current_user_id == @question.author_id

  erb :'questions/edit'
end

post '/questions/edit/:id' do
  @question = Question.find(params[:id])
  # need refactor to remove global nature of add_tags?

  if @question.update(params[:question])
    @question.remove_unused_tags(params[:tags])
    @question.add_tags(params[:tags])
    redirect("/questions/#{@question.id}")
  else
    erb :'/questions/edit/#{params[:id]}'
  end
end
