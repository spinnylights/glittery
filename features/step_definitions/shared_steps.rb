Given /^I am logged in as "(.*?)" with the password "(.*?)"$/ do |username, password|
  admin = Admin.create(username: username, password: password)

  log_in(admin.username, admin.password)
  page.should have_text 'Administration'

  store_admin(admin)
end

Given /^that an admin has an artist with info$/ do
  admin = Admin.external_config_admin
  artist = Admin.external_config_admin.artist

  artist.update_attributes(name: artist_name,
                           email: artist_email,
                           photo_url: artist_photo_url,
                           bio: artist_bio).should be_true
  artist.name.should == artist_name

  store_admin(admin)
end
