require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #alphabetically' do
    it 'returns http success' do
      get :alphabetically
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #with_modern_plan' do
    it 'returns http success' do
      get :with_modern_plan
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #not_trialing' do
    it 'returns http success' do
      get :not_trialing
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #created_last_month' do
    it 'returns http success' do
      get :created_last_month
      expect(response).to have_http_status(:success)
    end
  end
end
