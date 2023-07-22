# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'name' do
    subject { described_class.new(name: name, price: 100, description: '詳細説明', stock: 0) }

    context 'when nameが空文字' do
      let(:name) { '' }

      it { is_expected.to be_invalid }
    end

    context 'when nameが256文字以上' do
      let(:name) { 'a' * 256 }

      it { is_expected.to be_invalid }
    end
  end

  describe 'price' do
    subject { described_class.new(name: '商品', price: price, description: '詳細説明', stock: 0) }

    context 'when priceが半角整数以外' do
      let(:price) { '１００' }

      it { is_expected.to be_invalid }
    end

    context 'when priceが0未満' do
      let(:price) { -100 }

      it { is_expected.to be_invalid }
    end
  end

  describe 'description' do
    subject { described_class.new(name: '商品', price: 100, description: description, stock: 0) }

    context 'when descriptionが空文字' do
      let(:description) { '' }

      it { is_expected.to be_invalid }
    end

    context 'when descriptionが256文字以上' do
      let(:description) { 'a' * 256 }

      it { is_expected.to be_invalid }
    end
  end

  describe 'stock' do
    subject { described_class.new(name: '商品', price: 100, description: '詳細説明', stock: stock) }

    context 'when stockが半角整数以外' do
      let(:stock) { '１００' }

      it { is_expected.to be_invalid }
    end

    context 'when stockが0未満' do
      let(:stock) { -10 }

      it { is_expected.to be_invalid }
    end
  end
end
