class Answer < ActiveRecord::Base
  include Votable

  belongs_to :question
  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable
  has_many :votes, as: :votable


def check_repeat(user)
    self.votes.each do |vote|
      return false if vote.author_id == user.id
    end
    true
  end

end
