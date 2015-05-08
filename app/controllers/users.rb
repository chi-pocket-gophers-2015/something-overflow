get '/users/:user_id' do
  @user = User.find_by_id(params[:user_id])
  erb :profile
end

get '/questions/:question_id/answers/:answer_id/reply' do

end

post '/questions/:id' do
  if request.xhr?
    new_post = Answer.create(body: params[:body],  author_id: current_user.id, question_id: params[:id], commentable_id: params[:id],
      commentable_type:  "Answer")
    p "made it"
    new_post.wrap_for_answer
  else
    erb :"/questions/#{:params[:id]}"
  end
end
