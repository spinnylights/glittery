module AdminHelper
  def store_admin(admin)
    @admin = admin
  end

  def return_admin
    @admin
  end
end

module GeneralHelper
  def visit_change_password
    visit '/admin/edit'
    click_link 'Change Password'
  end

  def submit_form
    click_button 'Submit'
  end

  def wrong_username
    'whistleybustley'
  end

  def wrong_password
    'd$2dDjfsrif'
  end

  def right_username
    'bagsywagsy'
  end

  def right_password
    'fj$djSaisid'
  end
  def fill_change_password_form(current, new, confirm)
    fill_in 'Current password', with: current
    fill_in 'New password',     with: new
    fill_in 'Confirm password', with: confirm
  end

  def log_in(username, password)
    visit '/login'
    fill_in 'Username', with: username
    fill_in 'Password', with: password
    click_button 'Log in'
  end

  def log_out
    visit '/login'
    if page.has_content? 'Administration'
      click_button 'Log out'
    end
  end
end

World(AdminHelper)
World(GeneralHelper)
