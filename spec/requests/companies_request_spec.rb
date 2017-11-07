require 'rails_helper'

RSpec.describe '/companies endpoints', type: :request do
  describe 'GET /companies' do
    let!(:company) { FactoryBot.create(:company) }

    it 'returns a conversation' do
      get companies_url

      expect(response.body).to include(company.to_json)
    end
  end

  describe 'GET /companies/alphabetically' do
    let!(:company) { FactoryBot.create(:company, name: 'Alpha Co.') }

    before(:each) do
      FactoryBot.create(:company, name: 'Beta Co')
    end

    it 'orders conversations by name' do
      get companies_alphabetically_url

      response_body = JSON.parse(response.body)

      expect(response_body['data'].first['name']).to eq(company.name)
    end
  end
end
