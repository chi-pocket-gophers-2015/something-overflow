get "/questions/:id/comments/new" do
  redirect to "/login" unless logged_in?
  @new_comment = Comment.new(params[body])
  # erb :"partials/_comment_form"
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
  # erb :"partials/_comment_form"
end

post "/answers/:id/comments/new" do
  @new_comment = Comment.new(body: params[:comment], commentable_id: params[:id], commentable_type: "Answer")
  @new_comment.author = current_user
  @new_comment.save
end

