When /^I click Edit Gallery$/ do
    click_link 'Edit Gallery'
end

When /^click delete under Bag of Bags$/ do
   find('a[@href="/artworks/1]').click
end

Then /^the Bag of Bags artwork should no longer be in the gallery$/ do
    page.should_not contain 'Bag of Bags'
end
