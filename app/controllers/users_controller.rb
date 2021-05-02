class UsersController < ApplicationController
  def index
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      Group.create(name: 'No group', user_id: @user.id)
      Group.create(name: 'Market', user_id: @user.id)
      Group.create(name: 'Books', user_id: @user.id)
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'Thank you for signing up!'
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :email, :name, :password, :password_confirmation)
  end
end
