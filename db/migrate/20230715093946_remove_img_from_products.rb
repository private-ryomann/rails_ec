# frozen_string_literal: true

class RemoveImgFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :img, :string
  end
end
