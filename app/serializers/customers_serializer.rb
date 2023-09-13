# frozen_string_literal: true

class CustomersSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone_number
end
