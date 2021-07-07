class Article < ApplicationRecord
  has_one_attached :photo
  belongs_to :location

  validates :headline, presence: true, length: { maximum: 100 }
  validates :alt_text, length: { maximum: 100 }
  validates :caption, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :location_id, presence: true
end
