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
    if current_admin.authenticate(params[:admin][:password])
      if params[:admin][:new_password] == 
         params[:admin][:password_confirmation]
        current_admin.update_attributes(password: 
                                        params[:admin][:new_password],
                                        new_password: nil,
                                        password_confirmation: nil)
        render 'edit'   
      else
        flash[:error] = 'New password does not match confirmation'
        redirect_to password_admin_path
      end
    else
      flash[:error] = 'Wrong current password'
      redirect_to password_admin_path
    end
  end
end
