get "/comments/new" do
  redirect to "/login" unless logged_in?
  @new_comment = Comment.new(params[body])
  erb :_comment_form
end

post "/comments/new" do
  params.inspect
  # @new_comment = Comment.new(params[body])
  # @new_comment.author = current_user
  # @new_comment.save
end
