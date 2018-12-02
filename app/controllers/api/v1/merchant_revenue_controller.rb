class Api::V1::MerchantRevenueController < ApplicationController

	def show
		if params[:date]
			amount = Merchant.single_revenue_by_date(params[:id], params[:date])
		else
			amount = Merchant.revenue(params[:id])
		end
		revenue_object = Revenue.new(amount)
		render json: MerchantRevenueSerializer.new(revenue_object)
	end

end