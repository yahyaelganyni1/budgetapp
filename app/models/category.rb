class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :icon, presence: true

  belongs_to :user
  has_and_belongs_to_many :purchases

  def amount
    purchases.sum('amount')
  end
end
