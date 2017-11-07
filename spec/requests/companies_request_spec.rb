require 'rails_helper'

RSpec.describe '/companies endpoints', type: :request do
  describe 'GET /companies' do
    let!(:company) { FactoryBot.create(:company) }

    it 'returns a conversation' do
      get companies_url

      expect(response.body).to include(company.to_json)
    end
  end
end
