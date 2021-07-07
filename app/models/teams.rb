class Teams < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :categories_id, presence: true
  belongs_to :category, class_name: 'Category', inverse_of: :teams, optional: true
end
