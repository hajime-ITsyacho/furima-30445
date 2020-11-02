require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @pay = FactoryBot.build(:pay)
  end

  describe '商品の購入' do
    context '商品が購入できる場合' do

      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@pay).to be_valid
      end

    end

    context '商品が購入できない場合' do

      it 'tokenが存在しない場合保存できないこと' do
        @pay.token = nil
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Token can't be blank")
      end


      it 'post_codeが空だと購入できないこと' do
        @pay.post_code = nil
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Post code can't be blank")
      end

      it 'area_idが空だと購入できないこと' do
        @pay.area_id = nil
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Area can't be blank")
      end

      it 'cityが空だと購入できないこと' do
        @pay.city = nil
        @pay.valid?
        expect(@pay.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numが空だと購入できないこと' do
        @pay.house_num = nil
        @pay.valid?
        expect(@pay.errors.full_messages).to include("House num can't be blank")
      end

      it 'phone_numが空だと購入できないこと' do
        @pay.phone_num = nil
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Phone num can't be blank")
      end

      it 'post_codeにハイフンがないと購入できないこと' do
        @pay.post_code = '1234567'
        @pay.valid?
        expect(@pay.errors.full_messages).to include('Post code is invalid')
      end

      it 'phone_numにハイフンがあると購入できないこと' do
        @pay.phone_num = '090-1234-5678'
        @pay.valid?
        expect(@pay.errors.full_messages).to include('Phone num is invalid')
      end

      it 'phone_numが11桁より大きいと購入できないこと' do
        @pay.phone_num = '090123456789'
        @pay.valid?
        expect(@pay.errors.full_messages).to include('Phone num is invalid')
      end

      it 'area_idが1だと購入できないこと' do
        @pay.area_id = 1
        @pay.valid?
        expect(@pay.errors.full_messages).to include('Area must be other than 1')
      end

    end
  end
end