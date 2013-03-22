module SessionsHelper

  def sign_in(admin)
    cookies.permanent[:remember_token] = admin.remember_token
  end
end
