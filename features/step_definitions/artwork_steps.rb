Then /^I should see artwork images$/ do
  page.should have_selector(:xpath, '//div[@class="art"]//a//img') 
end

When /^I click on an artwork image$/ do
  visit '/'
  find('a[@href="/artworks/1"]').click 
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
