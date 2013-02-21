Given /^that I am on the \/login page$/ do
  visit '/login'
end

Given /^I am not logged in$/ do
  page.should have_content 'Log in'
end

When /^I enter the wrong credentials$/ do
  fill_in 'Username', with: 'imabag'
  fill_in 'Password', with: 'imabag'
  click_button 'Log in'
end

Then /^I should still be on the \/login page$/ do
  page.should have_content 'Log in'
end

Then /^I should be told that my credentials are wrong$/ do
  page.should have_content 'Wrong username/password'
end

When /^I enter the correct credentials$/ do
  fill_in 'Username', with: 'grangybears'
  fill_in 'Password', with: 'iam2bearSk!n'
  click_button 'Log in'
end

Then /^I should be on the main admin page$/ do
  page.should have_content 'Administration'
end
