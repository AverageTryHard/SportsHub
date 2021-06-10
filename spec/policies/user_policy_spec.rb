require 'rails_helper'

describe UserPolicy do
  subject { described_class }

  let(:admin) { build(:user, is_admin: true) }
  let(:regular_user) { build(:user, is_admin: false) }

  permissions :show?, :index? do
    it 'denies access if current user is not admin' do
      expect(subject).not_to permit(regular_user, build(:user))
    end

    it 'allow access if current user is admin' do
      expect(subject).to permit(admin, build(:user))
    end
  end
end
