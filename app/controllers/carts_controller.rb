# frozen_string_literal: true

class CartsController < ApplicationController
  
  #カートに追加などはここでやる
  def update
    if @current_cart.nil?
      redirect_to products_url
    end
    product = Product.find(params[:id])
    @current_cart.add(product)
    session[:cart] = @current_cart.serialize
    test = render turbo_stream: turbo_stream.replace(
      "cart-total", partial: "shared/cart_total", locals: { cart: @current_cart }
    )
    debugger
  end

  def delete
  end
end