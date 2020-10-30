class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :item_find, only: [:index, :create]

  def index
    @pay = Pay.new
  end

  def create
    @pay = Pay.new(purchase_params)
    if @pay.valid?
      @pay.save
      redirect_to root_path
    else
      render :index
    end
  end

  def item_find
    @item = Item.find(params[:item_id])
  end


  private

  def purchase_params
    params.permit(:post_code, :area_id, :city, :house_num, :building_name, :phone_num, :purchase_id, :item_id).merge(user_id: current_user.id)
  end

end
