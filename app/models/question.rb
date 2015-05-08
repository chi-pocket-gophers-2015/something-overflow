class Question < ActiveRecord::Base

  validates :author, :body, :title, {presence: true}

  belongs_to :author, class_name: 'User'
  has_many :comments, as: :commentable
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :answers
  has_many :votes, as: :votable

  def check_repeat(user)
    self.votes.each do |vote|
      return false if vote.author_id == user.id
    end
    true
  end


end
