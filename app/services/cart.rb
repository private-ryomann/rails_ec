class Cart
  attr_reader :products
  def initialize()
    @products = []
  end

  def add(product)
    @products << product
  end

  def delete(target)
    @products.delete_if{ |product| product.id === target.id }
  end

  def total
    @products.length
  end

  def serialize
    Marshal.dump(self)
  end

  def self.deserialize(value)
    Marshal.load(value)
  end
end