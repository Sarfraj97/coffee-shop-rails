# frozen_string_literal: true

class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :quantity, :category
  
  def category    
    object.category.title
  end

end
