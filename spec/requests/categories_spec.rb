require 'rails_helper'

RSpec.describe '/categories', type: :request do
  login_user

  describe 'GET /index' do
    it 'renders a successful response' do
      FactoryBot.create(:category, user: @user)
      get categories_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      category = FactoryBot.create(:category, user: @user)
      get category_url(category)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_category_url
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new category' do
        expect do
          post categories_url, params: { category: FactoryBot.attributes_for(:category) }
        end.to change(Category, :count).by(1)
      end

      it 'redirects to the created category' do
        post categories_url, params: { category: FactoryBot.attributes_for(:category) }
        expect(response).to redirect_to(root_url)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new category' do
        expect do
          post categories_url, params: { category: FactoryBot.attributes_for(:category, name: nil) }
        end.to change(Category, :count).by(0)
      end
    end
  end
end
