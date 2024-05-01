# frozen_string_literal: true

Category.create(
  [
    { title: 'Dulux' },
    { title: 'Asian' },
    { title: 'Dr. fixit' }
  ]
)

Item.create(
  [
    { name: 'Promise SC exterior', price: 3200, category_id: Category.first.id, quantity: 20, volume_type: 0 },
    { name: 'Promise SC interior', price: 2800, category_id: Category.first.id, quantity: 20, volume_type: 1 },    
    { name: 'Tractor Emulsion', price: 640, category_id: Category.second.id, quantity: 4, volume_type: 2 },
    { name: 'Tractor Emulsion', price: 1050, category_id: Category.second.id, quantity: 10 , volume_type: 0 },
    { name: 'Primer exterior', price: 1100, category_id: Category.first.id, quantity: 10 , volume_type: 2},
    { name: 'Primer interior', price: 950, category_id: Category.first.id, quantity: 10 , volume_type: 1 },
    { name: 'URP', price: 1000, category_id: Category.third.id, quantity: 10, volume_type: 2  },
    { name: 'LW+', price: 1050, category_id: Category.third.id, quantity: 10 , volume_type: 0 },
    { name: 'SuperCover', price: 850, category_id: Category.first.id, quantity: 4 , volume_type: 1 }
  ]
)

Customer.create!(
  [
    { name: 'random', phone_number: '1235567899'},
    { name: 'Ayyub bhai', phone_number: '9899899989' }
  ]
)
