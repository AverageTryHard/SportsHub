require 'rails_helper'

RSpec.describe 'Admin::Users', type: :request do
  describe 'GET /admin' do
    it 'Admin gets access to admin cabinet' do
      admin = build(:user, is_admin: true)
      admin.confirm
      sign_in admin
      get admin_root_path
      expect(response.status).to eq(200)
    end

    it 'User gets access to admin cabinet' do
      get admin_root_path
      expect(response.status).to eq(302)
    end
  end

  describe 'GET /admin/user' do
    before do
      admin = create(:user, is_admin: true)
      admin.confirm
      sign_in admin
    end

    it 'User block' do
      user_for_test = build(:user)
      user_for_test.confirm
      get admin_block_user_path(id: user_for_test)
      expect(user_for_test.reload.status).to eq('blocked')
    end

    it 'User activation' do
      user_for_test = build(:user, status: 'blocked')
      user_for_test.confirm
      get admin_activate_user_path(id: user_for_test)
      expect(user_for_test.reload.status).to eq('active')
    end
  end
end
