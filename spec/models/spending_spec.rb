require 'rails_helper'
require 'capybara/rspec'

RSpec.describe Spending, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(id: 1, name: 'name', email: 'email@testing.com', password: 'password')
    group = Group.create(id: 1, name: 'groupname', user_id: user.id)
    expect(Spending.new(name: 'spending-name', user_id: 1, group_id: group.id, amount: 25)).to be_valid
  end

  it 'is not valid without a user' do
    user = User.create(id: 1, name: 'name', email: 'email@testing.com', password: 'password')
    group = Group.create(id: 1, name: 'groupname', user_id: user.id)
    expect(Spending.new(name: 'spending-name', user_id: nil, group_id: group.id, amount: 25)).to_not be_valid
  end

  it 'is not valid without a group' do
    user = User.create(id: 1, name: 'name', email: 'email@testing.com', password: 'password')
    expect(Spending.new(name: 'spending-name', user_id: user.id, group_id: nil, amount: 25)).to_not be_valid
  end
end
