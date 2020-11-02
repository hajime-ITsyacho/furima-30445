class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :item_find, only: [:index, :create, :move_to_root_path]
  before_action :move_to_root_path, only: [:index]

  def index
    @pay = Pay.new
  end

  def create
    @pay = Pay.new(purchase_params)
    if @pay.valid?
      pay_item
      @pay.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_find
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.permit(:post_code, :area_id, :city, :house_num, :building_name, :phone_num, :purchase_id, :item_id, :token, :authenticity_token).merge(token: params[:token], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_root_path
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.purchase.present?
      redirect_to root_path
    end
  end

end
