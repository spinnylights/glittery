Given /^I am logged in as "(.*?)" with the password "(.*?)"$/ do |username, password|
  admin = Admin.create(username: username, password: password)

  log_in(admin.username, admin.password)
  page.should have_text 'Administration'

  store_admin(admin)
end
