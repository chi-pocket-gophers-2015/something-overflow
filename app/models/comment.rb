class Comment < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :votes, as: :votable
  belongs_to :commentable, polymorphic: true


  def wrap_for_comment
    "<div class='question-comments-buffer'>
            <div class='question-comments-container'>
              <div class= 'a-comment-body'>
                #{self.body}
                <a href='/users/#{self.author.id}/#{self.author.username}</a>
                  #{self.updated_at.strftime('%b %d')}
                at
                 #{self.updated_at.strftime('%R')}
                  <div id='a-comment-edit'>
                    <a href='/comments/edit/self.id'>
                      edit
                    </a>
                  </div>
              </div>
            </div>
          </div>".gsub(/\s+/, " ").strip
  end

end
