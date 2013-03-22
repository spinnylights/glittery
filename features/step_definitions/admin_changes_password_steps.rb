Given /^I am logged in as "(.*?)" with the password "(.*?)"$/ do |username, password|
  admin = Admin.create(username: username, password: password)

  visit '/login'
  fill_in 'Username', with: admin.username
  fill_in 'Password', with: admin.password
  click_button 'Log in' 

  page.should have_text 'Administration'
  store_admin(admin)
end

When /^I properly change my password to "(.*?)"$/ do |new_password|
  admin = return_admin
  click_link 'Change Password'
  fill_in 'Current password', with: admin.password
  fill_in 'New password', with: new_password
  fill_in 'Confirm password', with: new_password
  click_button 'Submit'
end

Then /^I should be on the Administration page$/ do
  page.should have_text 'Administration'
end

Then /^I should be able to log in with my new password$/ do
  click_button 'Log out'
  visit '/login'
  fill_in 'Username', with: admin.username 
  fill_in 'Password', with: admin.password 
  click_button 'Log in'
  page.should have_text 'Administration'
end

When /^enter the wrong password$/ do
  fill_in 'Current password', with: 'imabag' 
end

Then /^I should still be on the Change Password page$/ do
  page.should have_text 'Change Password'
end

Then /^I should be told that I entered my current password wrong$/ do
  page.should have_text 'Wrong current password'
end

Then /^I should not be able to log in with my new password$/ do
  click_link 'Back'
  click_button 'Log out'
  visit '/login'
  fill_in 'Username', with: 'grangybears'
  fill_in 'Password', with: 'iam2bearH@nds'
  click_button 'Log in'
  page.should have_text 'Log in'
  page.should have_text 'Wrong username/password'
end

When /^enter the password I want but mistype the confirmation$/ do
  fill_in 'New password',     with: 'iam2bearH@nds'
  fill_in 'Confirm password', with: 'imabag'
end

Then /^I should be told that my passwords don't match$/ do
  page.should have_text "New password does not match confirmation"
end
