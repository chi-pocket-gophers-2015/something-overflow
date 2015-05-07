class Tag < ActiveRecord::Base
  validates :word, {uniqueness: true}
  validates :word, {presence: true}

  has_many :taggings
  has_many :questions, through: :taggings

  def to_s
    word
  end
end
