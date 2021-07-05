Given 'I am admin user' do
  @user = FactoryBot.create(:confirmed_admin)
end

Given 'I am regular user' do
  @user = FactoryBot.create(:confirmed_user)
end

Given /^I am not logged in$/ do
  delete destroy_user_session_path
end
