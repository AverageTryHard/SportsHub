class Team < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :categories_id, presence: true
  belongs_to :categories, class_name: 'Category', inverse_of: :teams
end
