# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Productsデータ作成
20.times do |n|
  product = Product.create!(
    name: "商品#{n}",
    price: 100 * n,
    description: "商品#{n}の詳細説明",
    stock: n
  )

  product.thumbnail_image.attach(io: File.open(Rails.root.join('app/assets/images/thumbnail_image.jpg')),
                                 filename: 'thumbnail_image.jpg')
  product.main_image.attach(io: File.open(Rails.root.join('app/assets/images/main_image.jpg')),
                            filename: 'main_image.jpg')
end
