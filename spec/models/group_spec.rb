require 'rails_helper'
require 'capybara/rspec'

RSpec.describe Group, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(id: 1, name: 'name', email: 'email@testing.com', password: 'password')
    expect(Group.create(name: 'groupname', user_id: user.id)).to be_valid
  end

  it 'is not valid without a user' do
    expect(Group.create(name: 'groupname', user_id: nil)).to_not be_valid
  end

  it 'is not valid without a name' do
    user = User.create(id: 1, name: 'name', email: 'email@testing.com', password: 'password')
    expect(Group.create(name: nil, user_id: user.id)).to_not be_valid
  end

  it 'has many spendings' do
    should respond_to(:spendings)
  end
end
