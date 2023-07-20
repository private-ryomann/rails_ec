require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'nameカラム' do
    subject { Product.new(name: name, price: 100, description: "詳細説明", stock: 0) }

    context 'nameが空文字' do
      let(:name) { '' }
      it { is_expected.to be_invalid }
    end

    context 'nameが256文字以上' do
      let(:name) { 'a'*256 }
      it { is_expected.to be_invalid }
    end
  end

  describe 'price' do
    subject { Product.new(name: "商品", price: price, description: "詳細説明", stock: 0) }

    context 'priceが半角整数以外' do
      let(:price) { "１００" }
      it { is_expected.to be_invalid }
    end

    context 'priceが0未満' do
      let(:price) { -100 }
      it { is_expected.to be_invalid }
    end
  end


  describe 'description' do
    subject { Product.new(name: "商品", price: 100, description: description, stock: 0) }

    context 'descriptionが空文字' do
      let(:description) { "" }
      it { is_expected.to be_invalid }
    end

    context 'descriptionが256文字以上' do
      let(:description) { "a" * 256 }
      it { is_expected.to be_invalid }
    end
  end

  describe 'stock' do
    subject { Product.new(name: "商品", price: 100, description: "詳細説明", stock: stock) }

    context 'stockが半角整数以外' do
      let(:stock) { "１００" }
      it { is_expected.to be_invalid }
    end

    context 'stockがo未満' do
      let(:stock) { -10 }
      it { is_expected.to be_invalid }
    end
  end
end
