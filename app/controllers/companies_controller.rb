class CompaniesController < ApplicationController
  def index
    render json: { data: Company.all }
  end

  def alphabetically
    companies = Company.all.order(name: :asc)

    render json: { data: companies }
  end

  def with_modern_plan
    companies = Company.where.not(plan_level: ['custom', 'legacy'])

    render json: { data: companies }
  end

  def not_trialing
    companies = Company.where('trial_status < ?', Date.today)

    render json: { data: companies }
  end

  def created_last_month
    last_month_start = Date.today.last_month.at_beginning_of_month
    last_month_end   = Date.today.last_month.at_end_of_month

    companies = Company.where(created_at: last_month_start..last_month_end)

    render json: { data: companies }
  end
end
