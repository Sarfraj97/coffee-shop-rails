class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :category
  
  def category    
    object.category.title
  end

end
