class Category < ApplicationRecord
  validates :name, presence: true
  has_many :categories, dependent: :delete_all
  has_many :teams, dependent: :delete_all
end
