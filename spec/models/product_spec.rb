require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

      it 'should create new product if given all four required fields' do
        @category = Category.create!(name: 'Health')
        @product = Product.create!(name: 'Plus One HP', price: 1234, quantity: 56, category: @category)
        expect(@product).to be_valid
      end

      it 'should not be valid without a name' do
        @category = Category.create!(name: 'Health')
        @product = Product.new(name: nil, price: 1234, quantity: 56, category: @category)
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include('Name can\'t be blank')
      end

      it 'should not be valid without a price' do
        @category = Category.create!(name: 'Health')
        @product = Product.new(name: 'Plus One HP', price: nil, quantity: 56, category: @category)
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include('Price can\'t be blank')
      end

      it 'should not be valid without a quantity' do
        @category = Category.create!(name: 'Health')
        @product = Product.new(name: 'Plus One HP', price: 1234, quantity: nil, category: @category)
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include('Quantity can\'t be blank')
      end

      it 'should not be valid without a category' do
        @product = Product.new(name: 'Plus One HP', price: 1234, quantity: nil, category: nil)
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include('Category can\'t be blank')
      end

  end

end
