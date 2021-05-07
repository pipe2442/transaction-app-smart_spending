class SpendingsController < ApplicationController
  before_action :authorize

  def index
    @spending = Spending.new
    @spendings = []
    @groups = current_user.groups.with_group
    @groups.includes(:spendings).each do |group|
      group.spendings.each do |spending|
        @spendings.unshift(spending)
      end
    end
  end

  def external
    @external = current_user.groups.external
    @spendings = []
    @external.preload(:spendings).first.spendings.each do |spending|
      @spendings.unshift(spending)
    end
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
