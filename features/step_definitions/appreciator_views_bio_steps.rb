When /^I click on their bio link from the main page$/ do
  visit '/'
  click_link "bio"
end

Then /^I should see the artist's info/ do
  visit artist_path 
  page.should have_content artist_name
  page.should have_selector(:xpath, ".//a[@href='mailto:#{artist_email}']")
  page.should have_selector(:xpath, ".//img[@src='#{artist_photo_url}']")
  page.should have_content artist_bio
end
