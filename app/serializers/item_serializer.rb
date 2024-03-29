# frozen_string_literal: true

class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :company, :quantity
end
