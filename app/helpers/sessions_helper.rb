module SessionsHelper
  def sign_in(admin, perm_flag = false)
    if perm_flag
      cookies.permanent[:remember_token] = admin.remember_token
    else
      cookies[:remember_token] = admin.remember_token
    end
    current_admin = admin
  end

  def signed_in?
    if cookies[:remember_token]
      !current_admin.nil?
    end
  end

  def sign_out
    current_admin = nil
    cookies.delete(:remember_token)
  end

  def current_admin=(admin)
    @current_admin = admin
  end

  def current_admin
    @current_admin ||= 
    Admin.find_by_remember_token(cookies[:remember_token])
  end
end
