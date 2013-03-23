When /^I log out$/ do
  log_out
end

Then /^I should not be able to edit anything$/ do
  page.should_not have_content 'edit'
end

Then /^\/login should give me a login prompt$/ do
  visit '/login'
  page.should have_content 'Log in'
end
