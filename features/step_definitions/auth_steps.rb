def delete_user
  @user&.destroy
end

def sign_up
  visit '/users/sign_up'
  user = FactoryBot.build(:user)
  fill_in 'user_email', with: user[:email]
  fill_in 'user_first_name', with: user[:first_name]
  fill_in 'user_last_name', with: user[:last_name]
  fill_in 'user_password', with: user.password
  fill_in 'user_password_confirmation', with: user.password
  click_button 'Sign up'
  User.where(email: user[:email]).first
end

def sign_in
  visit '/users/sign_in'
  fill_in 'user_email', with: @user[:email]
  fill_in 'user_password', with: @user.password
  click_button 'Log in'
end

Given 'I am on the root page' do
  visit '/'
end

Given 'I sign up' do
  sign_up
end

Given 'I sign in' do
  sign_in
end

Then /^I should see "(.*?)"$/ do |text|
  expect(page).to have_content(text)
end

Then 'I should see email confirmation message' do
  expect(page).to have_content('A message with a confirmation link has been sent to your email address.')
end

Then 'I should see full name' do
  expect(page).to have_content(@user.full_name)
end
