class User < ActiveRecord::Base
  include BCrypt

  has_many :comments, foreign_key: :author_id
  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :author_id
  has_many :votes, foreign_key: :author_id

  validates :username, uniqueness: true
  validates :username, presence: true
  validates :first_name, presence: true

  def self.authenticate(user_credentials)
    current_user = User.find_by_username(user_credentials[:username])
    if current_user && current_user.password == user_credentials[:password]
      current_user
    else
      nil
    end
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def question_from_answer(auth_id)
    Question.find_by_id(auth_id)
  end

end
