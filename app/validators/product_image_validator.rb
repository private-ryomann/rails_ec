class ProductImageValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if !value.attached?
      record.errors.add(attribute, "を選択してください")
      return
    end
  end
end