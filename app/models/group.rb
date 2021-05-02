# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :user
  has_many :spendings, dependent: :destroy
  validates :name, presence: true
end
