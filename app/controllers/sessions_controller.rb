class SessionsController < ApplicationController
  def new
    if signed_in?
      redirect_to edit_admin_path
    end

    admin = Admin.new
    admin.populate_attr_from_config
    unless Admin.find_by_username(admin.username)
      admin.save
    end
  end

  def create
    admin = Admin.find_by_username(params[:username])
    if admin && admin.authenticate(params[:password]) 
      sign_in(admin, params[:remember_me])
      redirect_to edit_admin_path 
    else
      flash.now[:error] = 'Wrong username/password'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
