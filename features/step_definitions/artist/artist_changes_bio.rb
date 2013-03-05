When /^I click the Change Info link$/ do 
  click_link 'Change Info'
end

When /^change my name$/ do
  fill_in 'Name', with: 'Barry Bogs'
end

When /^change my email$/ do
  fill_in 'Email', with: 'barry@bogs.com'
end

When /^change the site's title$/ do
  fill_in 'Site title', with: 'Rabbit Food'
end

When /^change my bio$/ do
  fill_in 'Bio', with: 'I\'m an artist that feeds rabbits.'  
end

When /^press Submit$/ do
  click_button 'Submit' 
end

Then /^I should see the site's title changed across the page$/ do
  page.should have_content 'Rabbit Food'
end

Then /^I should see my bio, name, and email changed on the bio page$/ do
  visit '/artist'
  page.should have_content 'I\'m an artist that feeds rabbits.'
  page.should have_content 'Barry Bogs'
  page.should have_link('contact', {href: 'mailto:barry@bogs.com'})
end
