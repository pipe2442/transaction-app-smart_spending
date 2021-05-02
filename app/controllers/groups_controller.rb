class GroupsController < ApplicationController
  before_action :authorize

  def index
    @group = Group.new
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.create(spending_params)
    redirect_to groups_path
  end

  def destroy
    @group = Group.find(params[:id])
    Group.destroy(@group.id)
    redirect_to groups_path
  end

  private

  def spending_params
    params.require(:group).permit(:user_id, :name)
  end
end
