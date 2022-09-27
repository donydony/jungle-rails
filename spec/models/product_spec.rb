require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should be valid with all attributes' do
      @category = Category.new
      @product = Product.new

      @product.name = "Rose"
      @product.category = @category
      @product.price_cents = 1000
      @product.quantity = 10

      @product.save!
      expect(@product).to_not be_nil
    end

    it 'should produce validation error if name is nil' do
      @category = Category.new
      @product = Product.new

      @product.name = nil
      @product.category = @category
      @product.price_cents = 1000
      @product.quantity = 10

      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should produce validation error if category is nil' do
      @category = Category.new
      @product = Product.new

      @product.name = "Rose"
      @product.category = nil
      @product.price_cents = 1000
      @product.quantity = 10

      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

    it 'should produce validation error if price is nil' do
      @category = Category.new
      @product = Product.new

      @product.name = "Rose"
      @product.category = @category
      @product.price_cents = nil
      @product.quantity = 10

      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should produce validation error if price is nil' do
      @category = Category.new
      @product = Product.new

      @product.name = "Rose"
      @product.category = @category
      @product.price_cents = 1000
      @product.quantity = nil

      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
  end
end
