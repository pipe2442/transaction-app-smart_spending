# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email
  has_many :spendings
  has_many :groups
  has_one_attached :avatar
end
