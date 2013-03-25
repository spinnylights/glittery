Given /^that I have an admin account$/ do
  admin = Admin.create(username: right_username, 
                       password: right_password,
                       password_confirmation: right_password)
  store_admin(admin)
end

Given /^I am not logged in$/ do
  log_out
end

When /^I enter the wrong credentials at the login prompt$/ do
  admin = return_admin
  log_in(admin.username, wrong_password)
end

Then /^I should still be on the \/login page$/ do
  page.should have_content 'Log in'
end

Then /^I should be told that my credentials are wrong$/ do
  page.should have_content 'Wrong username/password'
end
