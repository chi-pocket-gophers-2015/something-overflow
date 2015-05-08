get "/questions/:id/comments/new" do
  redirect to "/login" unless logged_in?
  @new_comment = Comment.new(params[body])
  erb :'partials/_comment_form'
end

post "/questions/:id/comments/new" do
  @new_comment = Comment.new(body: params[:comment], commentable_id: params[:id], commentable_type: "Question")
  @new_comment.author = current_user
  @new_comment.save
  # redirect to ""?
end



get "/answers/:id/comments/new" do
  redirect to "/login" unless logged_in?
  @new_comment = Comment.new(params[body])
  erb :'partials/_comment_form'
end

post "/answers/:id/comments/new" do
  @new_comment = Comment.new(body: params[:comment], commentable_id: params[:id], commentable_type: "Answer")
  @new_comment.author = current_user
  @new_comment.save
end

post "/:user_id/:answer_id/comments/new" do
  if request.xhr?
    new_post = Comment.create(body: params[:body],  author_id: current_user.id, commentable_id: params[:answer_id], commentable_type: "Answer")
    new_post.wrap_for_comment
  else
    erb :'/questions/show'
  end
end

# post "/answers/:id/comments/new" do
#   if request.xhr?
#     new_post = current_user.comments.create(body: params[:body],  commentable_id: params[:answer_id], commentable_type: "Answer").save!
#     # p new_post
#     {body: params[:body], name: current_user.username, id: current_user.id}.to_json
#   else
#     erb :'/questions/show'
#   end
# end