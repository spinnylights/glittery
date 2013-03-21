Given /^that I am an appreciator \(and thus not logged in\)$/ do
  visit '/login'
  if page.has_text? 'Administration'
    click_button 'Log out'
  else
    visit '/'
  end
end

Then /^I should see artwork images$/ do
  page.should have_selector(:xpath, '//div[@class="art"]//a//img') 
end

Then /^I should not see Edit, Delete, or Add New Artwork links$/ do
  page.should_not have_link "Edit"
  page.should_not have_link "Delete"
  page.should_not have_link "Add New Artwork"
end

When /^I click on an artwork image$/ do
  visit '/'
  find(:xpath, '//div[@class="image"]/a[@href="/artworks/1"]').click 
end

Then /^I should see the artwork image$/ do
  page.should have_selector(:xpath, '//img[@alt="Bag"]')
end

Then /^I should see the name of the work$/ do
  page.should have_text 'Bag of Bags'
end

Then /^I should see a description of the work$/ do
  page.should have_text 'A bag of rich bags.'
end
