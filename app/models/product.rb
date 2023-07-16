class Product < ApplicationRecord
    has_one_attached :image
    paginates_per 8
end
