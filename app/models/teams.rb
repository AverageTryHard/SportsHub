class Teams < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
end
