class Api::V1::RevenueByDateController < ApplicationController

	def show
		revenue = Merchant.revenue_by_date(params[:date])
		revenue_object = MerchantsRevenue.new(revenue)
		render json: TotalRevenueSerializer.new(revenue_object)
  end
	
end