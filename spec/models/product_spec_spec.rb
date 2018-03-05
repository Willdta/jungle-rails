require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
  
    it 'should pass' do
      @category = Category.new(name: 'Music')
      @products = Product.new(name: 'Apple', quantity: 1, price: 10, category: @category)
      expect(@products).to be_valid
    end

    it 'should not pass due to a missing name' do
      @category = Category.new(name: 'Music')
      @products = Product.new(name: nil, quantity: 1, price: 10, category: @category)
      expect(@products).to_not be_valid
      expect(@products.errors[:name].size).to eq(1)
    end

    it 'should not pass due to a missing quanitity' do
      @category = Category.new(name: 'Music')
      @products = Product.new(name: nil, quantity: nil, price: 10, category: @category)
      expect(@products).to_not be_valid
      expect(@products.errors[:quantity].size).to eq(1)
    end

    it 'should not pass due to a missing price' do
      @category = Category.new(name: 'Music')
      @products = Product.new(name: nil, quantity: 1, price: nil, category: @category)
      expect(@products).to_not be_valid
      expect(@products.errors[:price].size).to eq(2)
    end

    it 'should not pass due to a missing category' do
      @category = Category.new(name: 'Music')
      @products = Product.new(name: 'Test', quantity: 1, price: 10, category: nil)
      expect(@products).to_not be_valid
      expect(@products.errors[:category].size).to eq(1)
    end

  end
end
