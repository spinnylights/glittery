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

  def artist_name
    'Whingy Basics'
  end

  def artist_email
    'whingy@basics.org'
  end

  def artist_bio
    'I am interested in basic forms of whinging.'
  end

  def artist_site_title
    'Basic Whinging'
  end

  def artwork_name
    'Whistley Thistley'
  end

  def artwork_description
    'A whistley thistley thistle.'
  end

  def photo_url(model, opts={filename: false} ) 
    case model
    when "artist"  then url = '/app/assets/images/grangy.jpg'
    when "artwork" then url = '/app/assets/images/124658.jpg'
    else raise ArgumentError, 
      "#{model} should be a model with a Paperclip attachment"
    end
    if opts[:filename]
      return url[/\w+\.(jpg|gif|png)/]
    else
      url
    end
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
