# frozen_string_literal: true

class Admin::ProductsController < ApplicationController
  http_basic_authenticate_with name: "test", password: "pass"
  before_action :product_params, only: [:create]

  def index
    @products = Product.all.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
    @latest_products = Product.all.where(['id != ?', @product.id]).order(:created_at).limit(4)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "#{@product.name}を商品リストに登録しました。"
      redirect_to admin_products_url
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    debugger
    if @product.update(product_params)
      flash[:success] = "#{@product.name}を更新しました。"
      redirect_to admin_products_url
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    flash[:success] = "#{product.name}を商品リストから削除しました。"
    redirect_to admin_product_url
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :stock, :main_image, :thumbnail_image)
  end
end