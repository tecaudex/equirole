class RolesController < ApplicationController
  before_action :authorize_page

  def index
    if current_user.admin?
      @roles = Role.all
    else
      @roles = Role.where(created_by: current_user.id)
    end
  end

  def create
    role = Role.new(role_params.merge!(created_by: current_user.id))
    if role.save
      flash[:success] = 'Successfully Created!'
    else
      flash[:alert] = 'Failed to Create!'
    end
    redirect_back fallback_location: root_path
  end

  def destroy
    @role = Role.find params['id']
    if @role.delete
      flash[:success] = 'Successfully Deleted!'
    else
      flash[:alert] = 'Failed to Delete!'
    end
    redirect_back fallback_location: root_path
  end


  private

  # Only allow a list of trusted parameters through.
  def role_params
    params.permit(:position, :catorgory)
  end

end
