class Sub < ActiveRecord::Base

  belongs_to :moderator,
    primary_key: :id,
    foreign_key: :moderator_id,
    class_name: :User

  has_many :postsubs, dependent: :destroy, inverse_of: :sub
  has_many :posts, through: :postsubs
end
