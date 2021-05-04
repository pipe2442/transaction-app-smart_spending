class Group < ApplicationRecord
  belongs_to :user
  has_many :spendings, dependent: :destroy
  validates :name, presence: true
  scope :with_group, -> { where.not(name: 'No group') }
  scope :external, -> { where(name: 'No group') }
end
