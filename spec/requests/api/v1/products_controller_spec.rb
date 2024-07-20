require 'rails_helper'

RSpec.describe Api::V1::ProductsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    it 'returns all products as JSON' do
      product = create(:product)
      get :index
      expect(JSON.parse(response.body).first["id"]).to eq(product.id)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
			let(:category) { create(:category) }

      let(:valid_attributes) do
        { product: attributes_for(:product, category_id: category.id) }
      end

      it 'creates a new product' do
        expect {
          post :create, params: valid_attributes
        }.to change(Product, :count).by(1)
      end

      it 'renders a JSON response with the new product' do
        post :create, params: valid_attributes
        expect(response.status).to eq(200)
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) do
        { product: { name: nil } } # Invalid attributes
      end

      it 'renders a JSON response with errors' do
        post :create, params: invalid_attributes
				expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['error']).to include("Name can't be blank")
      end
    end
  end

  describe 'PUT #update' do
    let!(:product) { create(:product) } # Assuming there's a product already created

    context 'with valid params' do
      let(:new_attributes) do
        { name: 'Updated Product Name' }
      end

      it 'updates the requested product' do
        put :update, params: { id: product.id, product: new_attributes }
        product.reload
        expect(product.name).to eq('Updated Product Name')
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) do
        { name: '' } # Invalid attributes
      end

      it 'renders a JSON response with errors' do
        put :update, params: { id: product.id, product: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['error']).to include("Name can't be blank")
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:product) { create(:product) } # Assuming there's a product already created

    it 'destroys the requested product' do
      expect {
        delete :destroy, params: { id: product.id }
      }.to change(Product, :count).by(-1)
    end

    it 'renders a JSON response with a success message' do
      delete :destroy, params: { id: product.id }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['message']).to eq('Product destroyed successfully')
    end
  end
end
