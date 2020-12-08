class Product < ApplicationRecord
  has_many :order_items
  has_many :assignments
  has_many_attached :photos

  accepts_nested_attributes_for :assignments
  has_many :colors, through: :assignments

  validates :title, presence: true
  validates :price, presence: true
  validates :stock, presence: true
  validates :photos, presence: true
end
