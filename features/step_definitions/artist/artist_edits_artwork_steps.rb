When /^click edit under an artwork$/ do
  page.find(:xpath, '//div[@id="Bag of Bags"]/
            a[@href="/artworks/1/edit"]').click
end

When /^change the artwork's name$/ do
  fill_in 'Name', with: 'Whisper'
end

When /^change the artwork's description$/ do
  fill_in 'Description', with: 'A quiet whisper.'
end

Then /^the artwork's name should be changed on the gallery and artwork pages$/ do
  page.should have_content 'Whisper'
  page.should_not have_content 'Bag of Bags'
end

Then /^the artwork's description should be changed on the artwork's page$/ do
  find(:xpath, '//div[@class="image"]/a[@href="/artworks/1"]').click
  page.should have_content 'Whisper'
  page.should have_content 'A quiet whisper.'
end
