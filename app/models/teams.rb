class Teams < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :categories_id, presence: true
end
