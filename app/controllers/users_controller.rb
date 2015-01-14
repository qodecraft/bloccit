class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def update
    if current.user.update_attributes(user_params)
      flash[:notice] = "Info Updated"
      redirect_to edit_user_registeration_path
    else
      flash[:error] = "Try again!"
      redirect_to edit_user_registration_path
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name)
  end
  
end
