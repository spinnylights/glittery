Then /^I should see artwork images$/ do
  page.should have_image ('.jpg' || '.png' || '.gif')
end
