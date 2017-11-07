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

  describe 'GET /companies/with_modern_plan' do
    let!(:modern_company) { FactoryBot.create(:company, plan_level: 'basic') }
    let!(:legacy_company) { FactoryBot.create(:company, plan_level: 'legacy') }

    it 'returns companies with a modern plan level' do
      get companies_with_modern_plan_url

      expect(response.body).to include(modern_company.to_json)
    end

    it 'does not return companies with non-modern plan levels' do
      get companies_with_modern_plan_url

      expect(response.body).not_to include(legacy_company.to_json)
    end
  end

  describe 'GET /companies/not_trialing' do
    let!(:inactive_company) { FactoryBot.create(:company, trial_status: Date.today - 1) }
    let!(:active_company) { FactoryBot.create(:company, trial_status: Date.tomorrow) }

    it 'returns companies that are not actively trialing' do
      get companies_not_trialing_url

      expect(response.body).to include(inactive_company.to_json)
    end

    it 'does not return companies that are actively trialing' do
      get companies_not_trialing_url

      expect(response.body).not_to include(active_company.to_json)
    end
  end

  describe 'GET /companies/created_last_month' do
    let!(:included_company) { FactoryBot.create(:company, created_at: Time.now.last_month) }
    let!(:excluded_company) { FactoryBot.create(:company, created_at: Time.now - 2.months) }

    it 'returns companies that were created during the last calendar month' do
      get companies_created_last_month_url

      expect(response.body).to include(included_company.to_json)
    end

    it 'does not return companies that were not created during the last calendar month' do
      get companies_created_last_month_url

      expect(response.body).not_to include(excluded_company.to_json)
    end
  end
end
