# frozen_string_literal: true

class SpendingsController < ApplicationController
  before_action :authorize

  def index
    @spending = Spending.new
    @spendings = Spending.all
  end

  def external
    @spendings = current_user.spendings.all
  end

  def show
    @spending = Spending.find(params[:id])
  end

  def new
    @spending = Spending.new
  end

  def create
    @spending = current_user.spendings.create(spending_params)
    if @spending.save && @spending.group.name == 'No group'
      redirect_to external_path
    else
      redirect_to spendings_path
    end
  end

  def destroy
    @spending = Spending.find(params[:id])
    Spending.destroy(@spending.id)
    if @spending.group.id == 1
      redirect_to external_path
    else
      redirect_to spendings_path
    end
  end

  private

  def spending_params
    params.require(:spending).permit(:user_id, :group_id, :name, :amount)
  end
end
