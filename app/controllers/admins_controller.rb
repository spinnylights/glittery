class AdminsController < ApplicationController
  def edit
    if !signed_in?
      redirect_to 'login'
    end
  end

  def password
    if !signed_in?
      redirect_to 'login'
    end
  end

  def update
    if current_admin.update_attributes(password: 
                                       params[:admin][:new_password],
                                       new_password: nil,
                                       password_confirmation:
                               params[:admin][:password_confirmation])
      render 'edit' 
    else
      render 'password' 
    end
  end
end
