# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ActiveStorage::SetCurrent

  before_action :set_cart

  def set_cart
    if session[:cart].nil?
      @current_cart = Cart.new
      session[:cart] = @current_cart.serialize
    end
    if @current_cart.nil?
      @current_cart = Cart.deserialize(session[:cart])
    end
  end
end
