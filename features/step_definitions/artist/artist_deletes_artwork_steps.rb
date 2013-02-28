When /^I click Edit Gallery$/ do
  click_link 'Edit Gallery'
end

When /^click delete under Bag of Bags$/ do
  page.find(:xpath, '//div[@id="Bag of Bags"]/a[@data-method="delete"]')
           .click
end

Then /^the Bag of Bags artwork should no longer be in the gallery$/ do
  page.should_not have_text 'Bag of Bags'
end
