class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 250 }
  belongs_to :parent_category, class_name: 'Category', inverse_of: :sub_categories, optional: true
  has_many :sub_categories, class_name: 'Category', foreign_key: 'parent_category_id',
                            inverse_of: :parent_category, dependent: :destroy
  has_many :teams, class_name: 'Team', foreign_key: 'categories_id', inverse_of: :categories, dependent: :destroy
  has_many :articles, inverse_of: :category, dependent: :destroy

  scope :primary, -> { where(parent_category_id: nil) }
  scope :sub_categories, -> { where.not(parent_category: nil) }

  validate :category_nesting

  def sub_category?
    parent_category_id.present?
  end

  def primary_category?
    parent_category_id.nil?
  end

  private

  def category_nesting
    errors.add(:parent_category_id, 'You can not use this category as parent.') if parent_category&.sub_category?
  end
end
