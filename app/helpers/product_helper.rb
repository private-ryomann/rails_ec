# frozen_string_literal: true

module ProductHelper
  def url_include?(path)
    request.url.include? path
  end

  def admin_page?
    url_include?('/admin')
  end

  def get_product_detail_path(product)
    admin_page? ? admin_product_path(product) : product_path(product)
  end

  def get_product_form_path(product)
    if admin_page? && url_include?('new')
      admin_products_path
    elsif admin_page? && url_include?('edit')
      admin_product_path(product)
    end
  end

  def error?(product, name)
    product.errors.include?(name)
  end

  def set_invalid(product, name)
    error?(product, name) ? 'invalid' : ''
  end
end
