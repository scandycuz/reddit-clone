class Post < ActiveRecord::Base
  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

  has_many :postsubs, dependent: :destroy, inverse_of: :posts
  has_many :subs, through: :postsubs
end
