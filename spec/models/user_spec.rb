require 'rails_helper'
require 'capybara/rspec'

RSpec.describe User, type: :model do
  it 'has many spendings' do
    should respond_to(:spendings)
  end

  it 'has many groups' do
    should respond_to(:groups)
  end
end
