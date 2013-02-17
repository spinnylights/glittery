When /^I click on the bio link from the main page$/ do
  visit '/'
  click_link "bio"
end

Then /^I should see the artist's name$/ do
  page.should have_content 'Grangy Bears'
end

Then /^I should see their photo$/ do
  page.should have_selector(:xpath, '//img[@alt="Grangy"]')
end

Then /^I should see their bio$/ do
  page.should have_content 'I\'m an artist that loves bags.'
end
