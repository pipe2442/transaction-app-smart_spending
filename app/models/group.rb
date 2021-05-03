class Group < ApplicationRecord
  belongs_to :user
  has_many :spendings, dependent: :destroy
  validates :name, presence: true

  scope :external, -> { where(name: "No group") }
end
