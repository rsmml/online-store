class Product < ApplicationRecord
  has_many :order_items
  has_many :assignments
  has_many_attached :photos
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories


  accepts_nested_attributes_for :assignments
  has_many :colors, through: :assignments

  validates :title, presence: true
  validates :price, presence: true
  validates :stock, presence: true
  validates :photos, presence: true
end
