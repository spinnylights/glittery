When /^I properly change my password to "(.*?)"$/ do |new_password|
  admin = return_admin
  visit_change_password
  fill_change_password_form(new_password, new_password)
  submit_form
  admin.password = new_password
  store_admin(admin)
end

When /^I enter the wrong confirmation password in the form$/ do
  admin = return_admin
  visit_change_password
  fill_change_password_form('iam2bearH@nds', wrong_password)
  submit_form
end

When /^I enter an invalid new password$/ do
  admin = return_admin
  visit_change_password
  fill_change_password_form('d' * 8, 'd' * 8)  
  submit_form
end

Then /^I should be on the Administration page$/ do
  page.should have_text 'Administration'
end

Then /^I should be able to log in with my new password$/ do
  admin = return_admin
  click_button 'Log out'
  log_in(admin.username, admin.password)
  page.should have_text 'Administration'
end

Then /^my new password should be reflected in the external config$/ do
  admin = return_admin

  File.open(Rails.root.to_s+'/config/admin.yml') do |file|
    attributes = Psych.load(file)
    attributes[:username].should == admin.username
    attributes[:password].should == admin.password
  end
end

Then /^I should still be on the Change Password page$/ do
  page.should have_text 'Change Password'
end

Then /^I should not be able to log in with my new password$/ do
  admin = return_admin
  click_link 'back'
  click_button 'Log out'
  log_in(admin.username, wrong_password)
  page.should have_text 'Log in'
  page.should have_text 'Wrong username/password'
end

Then /^I should be told that my passwords don't match$/ do
  page.should have_text "doesn't match confirmation"
end

Then /^I should be told that my password is invalid$/ do
  page.should have_text 'Change Password'
  page.should have_text 'Password must contain at least one'
end
