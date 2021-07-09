class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article, inverse_of: :comments
  belongs_to :commentable, polymorphic: true

  validates :body, presence: true, length: { maximum: 250 }
end
