When /^I edit an artwork$/ do
  visit '/'
  page.find(".//div[@id='#{artwork_name}']//a[contains(./@href, 'edit')]").click
  attach_file('Image', photo_url("artist"))
  fill_in 'Name', with: new_artwork_name
  fill_in 'Description', with: new_artwork_description
  click_button 'Submit'
end

Then /^the artwork's info should be changed$/ do
  visit '/'
  page.should have_content new_artwork_name
  page.should_not have_content artwork_name 
  page.should have_selector("//div[@id='#{new_artwork_name}']//img[contains(./@src, '#{photo_url("artist", filename: true)}')]")
  find(".//div[@id='#{new_artwork_name}']/div[@class='image']/a").click
  page.should have_content new_artwork_name
  page.should have_selector("//img[contains(./@src, '#{photo_url("artist", filename: true)}')]")
  page.should have_content new_artwork_description
end
