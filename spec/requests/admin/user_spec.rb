require 'rails_helper'

RSpec.describe 'Admin::Users', type: :request do
  describe 'GET /admin' do
    it 'Admin gets access to admin cabinet' do
      admin = create(:confirmed_admin)
      sign_in admin
      get admin_root_path
      expect(response.status).to eq(200)
    end

    it 'User gets access to admin cabinet' do
      user = create(:confirmed_user)
      sign_in user
      get admin_root_path
      expect(response.status).to eq(302)
    end

    it 'Guest gets access to admin cabinet' do
      get admin_root_path
      expect(response.status).to eq(302)
    end
  end

  describe 'PUT /admin/block_user' do
    let!(:user_for_test) { create(:confirmed_user) }

    it 'Admin block user' do
      admin = create(:confirmed_admin)
      sign_in admin
      put admin_block_user_path(id: user_for_test)
      expect(user_for_test.reload.status).to eq('blocked')
    end

    it 'User block other user' do
      user = create(:confirmed_user)
      sign_in user
      put admin_block_user_path(id: user_for_test)
      expect(user_for_test.reload.status).to eq('active')
    end
  end

  describe 'PUT /admin/activate_user' do
    let!(:user_for_test) { create(:confirmed_user, status: 'blocked') }

    it 'Admin activate user' do
      admin = create(:confirmed_admin)
      sign_in admin
      put admin_activate_user_path(id: user_for_test)
      expect(user_for_test.reload.status).to eq('active')
    end

    it 'User activate other user' do
      user = create(:confirmed_user)
      sign_in user
      put admin_activate_user_path(id: user_for_test)
      expect(user_for_test.reload.status).to eq('blocked')
    end
  end
end
