When /^I visit the main page$/ do
  visit '/'
end

Then /^I should see a header$/ do
  page.should have_selector './/h1'
end

Then /^I should see a gallery section$/ do
  page.should have_css '#gallery'
end
