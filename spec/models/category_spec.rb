require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name), max: 250 }

    context 'with category nesting' do
      it 'sub category cant be parent category' do
        sub_category = create(:category, :sub_category)
        record = build(:category, parent_category: sub_category)
        record.valid?

        expect(record.errors[:parent_category_id]).to include('You can not use this category as parent.')
      end

      it 'category without parent can have sub categories' do
        category = create(:category)
        sub_category = build(:category, :sub_category, parent_category: category)
        sub_category.valid?
      end
    end
  end

  describe '#sub_category?' do
    it 'returns true for category with parent id' do
      record = build(:category, parent_category_id: 1)

      expect(record.sub_category?).to eq true
    end

    it 'returns false for category without parent id' do
      record = build(:category)

      expect(record.sub_category?).to eq false
    end
  end
end
