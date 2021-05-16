class SpendingsController < ApplicationController
  before_action :authorize

  def author(spending)
    spend = []
    spending.preload(:group).each do |s|
      spend.unshift(s) if s.group.name != 'No group'
    end
    spend
  end

  def index
    @spending = Spending.new
    @spendings = author(current_user.spendings)
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
    @groups = Group.all
  end

  def new
    @spending = Spending.new
    @groups = Group.all
  end

  def create
    @groups = Group.all
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
