# frozen_string_literal: true

class ProductImageValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.attached?

    record.errors.add(attribute, 'を選択してください')
    nil
  end
end
