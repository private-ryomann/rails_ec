class Product < ApplicationRecord
    has_one_attached :image
    paginates_per 8

    validates :name, presence: true, length: { maximum: 255 }
    validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :description, presence: true, length: { maximum: 255 }
    validates :stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
