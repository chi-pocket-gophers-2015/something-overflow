class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :author, class_name: 'User'
  has_many :comments, as: :commentable
  has_many :votes, as: :votable


def check_repeat(user)
    self.votes.each do |vote|
      return false if vote.author_id == user.id
    end
    true
  end

  def wrap_for_answer
"              <div class='answer-container'>
            <div class='a-up-down-container'>
              <a href='/upvote/<%=@question.id%>/<%=answer.id%>/<%=current_user_id%>'><div class = 'upvote-symbol'></div></a>
              <div class='upvote-count'><%=tally_votes(answer)%></div>
              <a href='/downvote/<%=@question.id%>/<%=answer.id%>/<%=current_user_id%>'><div class = 'downvote-symbol'></div></a>
            </div>
            <div class='answer-body'>
              <%= answer.body %>
            </div>


          <div class='answer-author-container'>
            <div class='answer-username'>
              <a href='/users/<%= answer.author_id %>'>
                <%= answer.author.first_name %>
            </div>
            </a>
            <div class = 'answer-edit-container'>
            <% if current_user_id == answer.author.id %>
                <a href='/answers/edit/<%= answer.id %>'>
                  edit
                </a>
            <% end %>
          </div>
            <div class='answer-reply-time'>
              answered <%= answer.created_at.strftime('%b %d') %> at <%= answer.created_at.strftime('%R') %>
            </div>
          </div>
        </div>
        <div class='add-comment-button'>
          <div class='arrow-right'></div>
          <a class='answer-comment-button'  href='/answers/<%=answer.id%>/comments/new'>add a comment</a>
        </div>".gsub(/\s+/, " ").strip


  end

end
