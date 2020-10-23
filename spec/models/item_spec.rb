require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品の出品' do
      context '商品が出品できる場合' do
        it 'image/name/description/category_id/condition_id/charge_id/area_id/delivery_date_id/priceがあれば保存できる' do
          expect(@item).to be_valid
        end
      end

      context '商品が出品できない場合' do
        it 'imageがなければ出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'nameがなければ出品できない' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it 'descriptionがなければ出品できない' do
          @item.description = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
        it 'category_idがなければ出品できない' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
        end
        it 'condition_idがなければ出品できない' do
          @item.condition_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition can't be blank", 'Condition is not a number')
        end
        it 'charge_idがなければ出品できない' do
          @item.charge_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Charge can't be blank", 'Charge is not a number')
        end
        it 'area_idがなければ出品できない' do
          @item.area_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Area can't be blank", 'Area is not a number')
        end
        it 'delivery_date_idがなければ出品できない' do
          @item.delivery_date_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery date can't be blank", 'Delivery date is not a number')
        end
        it 'priceがなければ出品できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'ユーザーが紐づいていないと出品できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist')
        end
        it 'category_idが1の場合出品できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 1')
        end
        it 'condition_idが1の場合出品できない' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Condition must be other than 1')
        end
        it 'charge_idが1の場合出品できない' do
          @item.charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Charge must be other than 1')
        end
        it 'area_idが1の場合出品できない' do
          @item.area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Area must be other than 1')
        end
        it 'delivery_date_idが1の場合出品できない' do
          @item.delivery_date_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Delivery date must be other than 1')
        end
        it 'priceが300~9999999以外だと出品できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
        end
        it 'priceが9999999より大きいと出品できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
        end
      end
    end
  end
end
