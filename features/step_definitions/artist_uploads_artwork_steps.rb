When /^I add a new artwork$/ do
  clear_artworks

  visit '/'
  click_link 'Add New Artwork'
  fill_in 'Name', with: artwork_name 
  fill_in 'Description', with: artwork_description 
  attach_file('Image', photo_url("artwork"))
  click_button 'Submit'
end

When /^I try to add an artwork without an image$/ do
  clear_artworks

  visit '/'
  click_link 'Add New Artwork'
  fill_in 'Name', with: artwork_name
  fill_in 'Description', with: artwork_description
  click_button 'Submit'
end

Then /^the artwork should appear in the gallery$/ do
  page.should have_content artwork_name
  page.should have_selector("//div[@id='#{artwork_name}']//img[contains(./@src, '#{photo_url("artwork", filename: true)}')]")
end

Then /^its info should appear on its page$/ do
  find(".//div[@id='#{artwork_name}']/div[@class='image']/a").click
  page.should have_content artwork_name
  page.should have_selector("//img[contains(./@src, '#{photo_url("artwork", filename: true)}')]")
  page.should have_content artwork_description
end

Then /^I should still be on the new artwork page$/ do
  page.should have_field 'Description'
end

Then /^I should be told that I need to pick an image to upload$/ do
  page.should have_content 'Please select an image to upload.'
end
