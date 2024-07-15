require 'rails_helper'

RSpec.describe Api::V1::OrdersController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'returns all orders as JSON' do
      orders = create_list(:order, 3)
      get :index
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe 'GET #show' do
    let(:order) { create(:order) }
    let(:product) { create(:product) }
    let(:order_items) { create(:order_items, order: order, product: product) }

    it 'returns a success response' do
      get :show, params: { id: order.id }
      expect(response).to have_http_status(:ok)
    end

    it 'returns the correct order as JSON' do
      get :show, params: { id: order.id }
      expect(JSON.parse(response.body)["id"]).to eq(order.id)
    end
  end

  describe 'POST #create' do
    let(:customer) { create(:customer) }
    let(:valid_order_params) do
      {
        order: {
          status: 'in_progress',
        },
        product_ids: [
          { id: create(:product).id, quantity: 2 },
          { id: create(:product).id, quantity: 1 }
        ]
      }
    end

    context 'with valid params' do
      it 'creates a new order' do
        expect {
          post :create, params: valid_order_params.merge(id: customer.id)
        }.to change(Order, :count).by(1)
      end

      it 'creates order items associated with the order' do
        post :create, params: valid_order_params.merge(id: customer.id)
        expect(Order.last.order_items.count).to eq(2)
      end

      it 'returns a JSON response with the new order' do
        post :create, params: valid_order_params.merge(id: customer.id)
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['order_items'].size).to eq(2)
        expect(JSON.parse(response.body)['products'].size).to eq(2)
      end
    end

    context 'with invalid params' do
      let(:invalid_order_params) do
        {
          order: {
            status: 'in_progress',
          },
        }
      end

      it 'does not create a new order' do
        expect {
          post :create, params: invalid_order_params.merge(id: customer.id)
        }.not_to change(Order, :count)
      end

      it 'returns a JSON response with errors' do
        post :create, params: invalid_order_params.merge(id: customer.id)
        expect(JSON.parse(response.body)['error']).to eq("Product IDs are missing")
      end
    end
  end

  describe 'PUT #update' do
    let(:order) { create(:order) }  # Assuming you have FactoryBot set up for Order

    context 'with valid params' do
      let(:valid_update_params) do
        {
          id: order.id,
          order: {
            total_price: 150.0,
            status: 'completed',
            phone_number: '987-654-3210'
          },
          product_ids: [
            { id: create(:product).id, quantity: 3 }
          ]
        }
      end

      it 'updates the order' do
        put :update, params: valid_update_params
        order.reload
        expect(order.total_price).to eq(150.0)
        expect(order.status).to eq('completed')
        expect(order.phone_number).to eq('987-654-3210')
      end

      it 'updates order items associated with the order' do
        put :update, params: valid_update_params
        order.reload
        expect(order.order_items.count).to eq(1)
        expect(order.order_items.first.quantity).to eq(3)
      end

      it 'returns a JSON response with the updated order' do
        put :update, params: valid_update_params
        expect(response).to have_http_status(:ok)
        expect(response.body).to eq(order.reload.to_json)
      end
    end

    context 'with invalid params' do
      let(:invalid_update_params) do
        { id: order.id, order: { total_price: nil } }
      end

      it 'does not update the order' do
        put :update, params: invalid_update_params
        order.reload
        expect(order.total_price).not_to be_nil
      end

      it 'returns a JSON response with errors' do
        put :update, params: invalid_update_params
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['error']).to include("Total price can't be blank")
      end
    end
  end

  # describe 'DELETE #destroy' do
  #   let!(:order) { create(:order) }  # Using let! to create the order before each test

  #   it 'destroys the order' do
  #     expect {
  #       delete :destroy, params: { id: order.id }
  #     }.to change(Order, :count).by(-1)
  #   end

  #   it 'returns a JSON response with a success message' do
  #     delete :destroy, params: { id: order.id }
  #     expect(response).to have_http_status(:ok)
  #     expect(JSON.parse(response.body)['message']).to eq('Order Cancelled successfully')
  #   end
  # end
end
