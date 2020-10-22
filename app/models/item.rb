class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :area
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_date
  belongs_to_active_hash :charge

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :description
    validates :category
    validates :condition
    validates :name
    validates :charge
    validates :area
    validates :delivery_date
    validates :image
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :area_id
    validates :delivery_date_id
  end

end
