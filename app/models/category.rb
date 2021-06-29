class Category < ApplicationRecord
  validates :name, presence: true
  validates :categories_id, presence: true
end
