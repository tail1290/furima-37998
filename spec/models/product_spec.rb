require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
    @product.image = fixture_file_upload('/furima-footer.png')
  end

  describe '商品情報入力' do
    context '商品情報入力が正しくできた時' do
      it '全ての値が正しく入力されていれば出品できること' do
        expect(@product).to be_valid
      end
    end

    context '商品情報の入力に不備がある時' do
      it 'imageが空だと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'product_nameが空だと出品できない' do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end
      it 'product_textが空だと出品できない' do
        @product.product_text = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Product text can't be blank")
      end
      it 'category_idが未選択だと出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end
      it 'condition_idが未選択だと出品できない' do
        @product.condition_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition must be other than 1")
      end
      it 'load_idが未選択だと出品できない' do
        @product.load_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Load must be other than 1")
      end
      it 'area_kenが未選択だと出品できない' do
        @product.area_ken_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Area ken must be other than 1")
      end
      it 'date_shipmentが未選択だと出品できない' do
        @product.date_shipment_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Date shipment must be other than 1")
      end
      it 'valueが空だと出品できない' do
        @product.value = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Value can't be blank")
      end
      it 'priceが全角数字だと出品できない' do
        @product.value = "２０００"
        @product.valid?
        expect(@product.errors.full_messages).to include("Value is invalid")
      end
    end
  end
end

