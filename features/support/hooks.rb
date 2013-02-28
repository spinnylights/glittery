Before("@password_sensitive") do
  visit '/login'
  if page.has_text? 'Administration'
    click_button 'Log out'
    visit '/login'
  end
  fill_in 'Username', with: 'grangybears'
  fill_in 'Password', with: 'iam2bearSk!n'
  click_button 'Log in'
  if page.has_text? 'Log in'
    fill_in 'Username', with: 'grangybears'
    fill_in 'Password', with: 'iam2bearH@nds'
    click_button 'Log in'
    click_link 'Change Password'
    fill_in 'Current password', with: 'iam2bearH@nds'
    fill_in 'New password', with: 'iam2bearSk!n'
    fill_in 'Confirm password', with: 'iam2bearSk!n'
    click_button 'Submit'
    click_button 'Log out'
  else
    click_button 'Log out'
  end
end
