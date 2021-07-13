require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { build(:user) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(6).on(:create) }
  end

  describe 'Upload avatar' do
    let(:test_user) { FactoryBot.build(:user) }

    context 'with a valid user' do
      it 'saves the image' do
        test_user.save!
        test_user.avatar.attach(io: File.open(Rails.root.join('app/assets/images/avatar.jpg')),
                                filename: 'avatar.jpg',
                                content_type: 'image/jpg')
        expect(test_user.avatar).to be_a_kind_of(ActiveStorage::Attached::One)
      end
    end
  end
end
