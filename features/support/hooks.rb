Before("@password_sensitive") do
  correct_username = ""
  correct_password = "" 

  File.open("config/admin.yml") do |file|
    attributes = Psych.load(file)
    correct_username = attributes[:username]
    correct_password = attributes[:password]
  end

  visit '/login'
  if page.has_text? 'Administration'
    click_button 'Log out'
    visit '/login'
  end
  fill_in 'Username', with: correct_username
  fill_in 'Password', with: correct_password
  click_button 'Log in'
  if page.has_text? 'Log in'
    fill_in 'Username', with: correct_username
    fill_in 'Password', with: 'iam2bearH@nds'
    click_button 'Log in'
    click_link 'Change Password'
    fill_in 'Current password', with: 'iam2bearH@nds'
    fill_in 'New password', with: correct_password
    fill_in 'Confirm password', with: correct_password
    click_button 'Submit'
    click_button 'Log out'
  else
    click_button 'Log out'
  end
end
