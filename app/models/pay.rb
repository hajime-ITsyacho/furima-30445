class Pay
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :area_id, :city, :house_num, :building_name, :phone_num, :purchase_id

  with_options presence: true, format: { with: /\A^\d{3}[-]\d{4}$\Z/ } do
    validates :post_code
  end


  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :area_id, numericality: { other_than: 1 }


  with_options presence: true do
    validates :area_id
    validates :city
    validates :house_num
    validates :building_name
  end

  with_options presence: true, format: { with: /\A^\d{10}$|^\d{11}$\Z/ } do
    validates :phone_num
  end

  def save
    @purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, area_id: area_id, city: city, house_num: house_num, building_name: building_name, phone_num: phone_num, purchase_id: @purchase.id)
  end
end