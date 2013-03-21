When /^click Add New Artwork$/ do
  click_link 'Add New Artwork'
end

When /^add a name for the artwork$/ do
  fill_in 'Name', with: 'Piccary Habits'
end

When /^add a description for the artwork$/ do
  fill_in 'Description', with: 'The essence of piccary behaviors.'
end

When /^select the artwork's image for uploading$/ do
  attach_file('Image', '/Users/zonodon/Pictures/124658.jpg')
end

Then /^the artwork's name and image should appear in the gallery$/ do
  page.should have_content 'Piccary Habits'
  page.should have_selector(:xpath, 
              '//div[@class="art"]//a//img[@alt="124658"]')
end

Then /^its name, image, and description should appear on its page$/ do
  page.find(:xpath, 
            '//div[@id="Piccary Habits"]/div[@class="image"]/a').click
  page.should have_content 'Piccary Habits'
  page.should have_selector(:xpath, '//img[@alt="124658"]')
  page.should have_content 'The essence of piccary behaviors.'
end

Then /^I should still be on the new artwork page$/ do
  page.should have_field 'Description'
end

Then /^I should be told that I need to pick an image to upload$/ do
  page.should have_content 'Please select an image to upload.'
end
