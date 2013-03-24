When /^I change my artist information$/ do 
  admin = return_admin
  admin.artist.update_attributes(name: nil, bio: nil, photo: nil,
                                 site_title: nil).should be_true
  
  visit '/admin/edit'
  click_link 'Change Info'
  fill_in 'Name', with: artist_name
  fill_in 'Email', with: artist_email
  fill_in 'Site title', with: artist_site_title
  attach_file('Photo', Rails.root.join('public', 'artist', 
                                        'grangy.jpg').to_s)
  fill_in 'Bio', with: artist_bio
  click_button 'Submit'
end

Then /^I should see the site's title changed across the page$/ do
  page.should have_content artist_site_title 
end
