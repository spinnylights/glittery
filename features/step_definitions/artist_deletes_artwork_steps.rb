When /^I delete an artwork$/ do
  visit '/admin/edit'
  click_link 'Edit Gallery'
  page.find(".//div[@id='#{artwork_name}']//a[@data-method='delete']")
           .click
end

Then /^the artwork should no longer be in the gallery$/ do
  admin = return_admin
  page.should_not have_selector ".//div[@id='#{artwork_name}']"
  admin.artist.artworks.find_by_name("#{artwork_name}").should be_nil
end
