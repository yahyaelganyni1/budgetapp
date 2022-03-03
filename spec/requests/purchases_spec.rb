require 'rails_helper'

RSpec.describe '/purchases', type: :request do
  login_user

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_purchase_url
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new purchase' do
        expect do
          post purchases_url,
               params: { purchase: FactoryBot.attributes_for(:purchase,
                                                             category_ids: [FactoryBot.create(:category).id]) }
        end.to change(Purchase, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new purchase' do
        expect do
          post purchases_url, params: { purchase: FactoryBot.attributes_for(:purchase, name: nil) }
        end.to change(Purchase, :count).by(0)
      end
    end
  end
end
