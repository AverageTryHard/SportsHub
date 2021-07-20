require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations' do
    subject { build(:article) }

    it { is_expected.to validate_presence_of(:headline) }
    it { is_expected.to validate_presence_of(:caption) }
    it { is_expected.to validate_length_of(:headline).is_at_most(100) }
    it { is_expected.to validate_length_of(:alt_text).is_at_most(100) }
    it { is_expected.to validate_length_of(:caption).is_at_most(100) }
  end

  describe 'Upload photo' do
    let(:test_article) { FactoryBot.build(:article) }

    context 'with a valid article' do
      it 'saves the image' do
        test_article.save!
        test_article.photo.attach(io: File.open(Rails.root.join('app/assets/images/avatar.jpg')),
                                  filename: 'avatar.jpg',
                                  content_type: 'image/jpg')
        expect(test_article.photo).to be_a_kind_of(ActiveStorage::Attached::One)
      end
    end
  end
end
