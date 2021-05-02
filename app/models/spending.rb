# frozen_string_literal: true

class Spending < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :name, presence: true
  validates :amount, presence: true
  validates :group_id, presence: true
end
