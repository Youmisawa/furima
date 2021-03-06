class Item < ApplicationRecord
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true, reject_if: :no_image, update_only: true
  has_many :purchase_informations
  has_many :comments
  belongs_to :user
  belongs_to :category
  has_many :purchases
  # belongs_to :brand
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :size
  belongs_to_active_hash :state
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :prefecture

  # validates_associated :item_images
  validates :name, presence: true, length: { maximum: 40 }
  validates :explanation, presence: true, length: { maximum: 1000 }
  validates :size_id, presence: true
  validates :state_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :shipping_date_id, presence: true
  validates :prefecture_id, presence: true
  validates :price, presence: true
  validates :item_images, length: { minimum: 1, maximum: 5, message: "の数が不正です" } 

  def no_image(item_images_attributes)
    item_images_attributes[:url].blank?
  end
end
