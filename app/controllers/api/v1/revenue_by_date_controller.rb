class Api::V1::RevenueByDateController < ApplicationController

	def show
		date = params[:date]
		day_revenue = Hash.new(0)
		revenue = Hash.new(0)
		day_revenue["data"] = [revenue]
		revenue[:revenue] = (Merchant.revenue_by_date(date).to_f / 100).to_s
		render json: day_revenue
  end
	
end