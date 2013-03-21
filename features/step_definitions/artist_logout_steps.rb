Given /^that I am on the main admin page \(and thus logged in\)$/ do
  visit '/artist/edit'
  if page.has_content? 'Log in'
    fill_in 'Username', with: correct_username
    fill_in 'Password', with: correct_password
    click_button 'Log in'
  end
  page.should have_text 'Administration'
end

When /^I click 'Log out'$/ do
  click_button 'Log out'
end

Then /^I should not be able to edit anything$/ do
  page.should_not have_content 'edit'
end

Then /^\/login should give me a login prompt$/ do
  visit '/login'
  page.should have_content 'Log in'
end
