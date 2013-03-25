When /^I properly change my password to "(.*?)"$/ do |new_password|
  admin = return_admin
  visit_change_password
  fill_change_password_form(admin.password, new_password, 
                            new_password)
  submit_form
  admin.password = new_password
  store_admin(admin)
end

When /^I enter the wrong current password in the form$/ do
 visit_change_password
 fill_change_password_form(wrong_password, wrong_password,
                           wrong_password)
 submit_form
end

When /^I enter the wrong confirmation password in the form$/ do
  admin = return_admin
  visit_change_password
  fill_change_password_form(admin.password, 'iam2bearH@nds', 
                            wrong_password)
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

Then /^I should be told that I entered my current password wrong$/ do
  page.should have_text 'Wrong current password'
end

Then /^I should not be able to log in with my new password$/ do
  admin = return_admin
  click_link 'Back'
  click_button 'Log out'
  log_in(admin.username, wrong_password)
  page.should have_text 'Log in'
  page.should have_text 'Wrong username/password'
end

Then /^I should be told that my passwords don't match$/ do
  page.should have_text "New password does not match confirmation"
end
