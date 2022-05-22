class AdminController < ApplicationController

  def users
    @users = User.all
  end

  def del_user
    @user = User.find params['id']
    @user.delete
    flash[:success] = 'Successfully Deleted!'
    redirect_to users_admin_index_path
  end

end
