class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :questions, through: :tagg ings
end
