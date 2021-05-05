class Group < ApplicationRecord
  belongs_to :user
  has_many :spendings, dependent: :destroy
  validates :name, presence: true
  has_one_attached :icon
  scope :with_group, -> { where.not(name: 'No group') }
  scope :external, -> { where(name: 'No group') }
end
