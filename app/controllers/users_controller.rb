class UsersController < ApplicationController
  def destroy
    @user = current_user
    @user.active = false

    if @user.save
      flash[:alert] = "Your account has been successfully deleted!"
      sign_out(current_user)
    end
  end
end
