class Category < ApplicationRecord
  paginates_per 2
  validates :name, presence: true, length: { maximum: 250 }
  belongs_to :parent_category, -> { where parent_category_id: nil },
             class_name: 'Category', inverse_of: :sub_categories, optional: true
  has_many :sub_categories, class_name: 'Category', foreign_key: 'parent_category_id',
                            inverse_of: :parent_category, dependent: :destroy
  validates :sub_categories, length: { maximum: 2 }
  has_many :teams, class_name: 'Teams', foreign_key: 'categories_id', inverse_of: :category, dependent: :destroy

  def validate_sub_categories_number
    errors.add(:sub_categories, 'Only')
  end
end
