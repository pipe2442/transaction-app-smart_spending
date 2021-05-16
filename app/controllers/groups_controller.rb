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
    @group = current_user.groups.create(group_params)
    redirect_to groups_path
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    Group.destroy(@group.id)
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:user_id, :name, :icon)
  end
end
