class Tag < ActiveRecord::Base
  validates :word, {uniqueness: true}
  validates :word, {presence: true}
# minor change!
  has_many :taggings
  has_many :questions, through: :taggings
end
