module GeneralHelper
  def visit_change_password
    visit '/admin/edit'
    click_link 'Change Password'
  end

  def submit_form
    click_button 'Submit'
  end

  def fresh_admin
    Admin.new(username: "fastwishes", password: "m!stY5ands")
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

  def fill_change_password_form(new, confirm)
    fill_in 'New password',     with: new
    fill_in 'Confirm password', with: confirm
  end

  def populate_artist_info(artist)
    artist.update_attributes(name: artist_name,
                             email: artist_email,
                             bio: artist_bio).should be_true
    artist.photo.instance_write(:file_name, 
                                photo_url("artist", filename: true))
    artist.photo.save.should be_true
    artist.save.should be_true
    artist.name.should == artist_name
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

  def new_artwork_name
    'Whisper'
  end

  def new_artwork_description
    'A quiet whisper.'
  end

  def generate_artwork_for_admin(admin)
    artist = admin.artist
    artwork = artist.artworks.new(name: artwork_name,
                                  description: artwork_description)
    artwork.image.instance_write(:file_name,
                                photo_url("artwork", filename: true))
    artwork.image.save.should be_true
    artwork.save
    artwork
  end

  def clear_artworks
    admin = return_admin
    admin.artist.artworks.clear
    admin.artist.artworks.empty?.should be_true
  end


  def photo_url(model, opts={filename: false} ) 
    case model
    when "artist"  then url = Rails.root.to_s +
                              '/app/assets/images/grangy.jpg'
    when "artwork" then url = Rails.root.to_s +
                              '/app/assets/images/124658.jpg'
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
