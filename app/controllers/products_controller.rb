# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
    @latest_products = Product.all.where(['id != ?', @product.id]).order(:created_at).limit(4)
  end
end
