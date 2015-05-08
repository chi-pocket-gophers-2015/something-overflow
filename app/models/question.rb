class Question < ActiveRecord::Base
  include Votable

  validates :author, :body, :title, {presence: true}

  belongs_to :author, class_name: "User"
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


  def add_tags(tag_string)
    tag_string.split(" ").each do |tag_word|
    tag = Tag.find_or_create_by(word: tag_word)

      #check for tagging on this object.
      if !Tagging.find_by(question: self, tag: tag)
        #if question has not already been tagged by this object, then tag
        self.tags << tag
      end
    end
  end


  def remove_unused_tags (tag_string)
    current_tags = tag_string.split(" ")
    unused_taggings = self.taggings.to_a.select {|tagging| !current_tags.include?(tagging.tag.word)}
    unused_taggings.each { |tagging| Tagging.destroy(tagging.id)}
  end

end
