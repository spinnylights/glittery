Given /^I am logged in as "(.*?)" with the password "(.*?)"$/ do |username, password|
  admin = Admin.create(username: username, password: password)

  log_in(admin.username, admin.password)
  page.should have_text 'Administration'

  store_admin(admin)
end

Given /^that I am logged in as an admin$/ do
  admin = Admin.external_config_admin
  log_in(admin.username, admin.password)
  store_admin(admin)
end

Given /^that an admin has an artist with info$/ do
  admin = Admin.external_config_admin
  artist = admin.artist 

  artist.update_attributes(name: artist_name,
                           email: artist_email,
                           bio: artist_bio).should be_true
  artist.photo.instance_write(:file_name, 
                              photo_url("artist", filename: true))
  artist.photo.save.should be_true
  artist.save.should be_true
  artist.name.should == artist_name

  store_admin(admin)
end

Given /^there is artwork in the gallery/ do
  admin = Admin.external_config_admin
  generate_artwork_for_admin(admin)
  store_admin(admin)
end

Then /^I should see the artist's correct info/ do
  visit artist_path 
  page.should have_content artist_name
  page.should have_selector(".//a[@href='mailto:#{artist_email}']")
  page.should have_selector(".//img[contains(./@src, 
                       '#{photo_url("artist", filename: true)}')]")
  page.should have_content artist_bio
end
