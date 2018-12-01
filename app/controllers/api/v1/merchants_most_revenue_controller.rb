class Api::V1::MerchantsMostRevenueController < ApplicationController

	def index
		num = params["quantity"]
		render json: MerchantSerializer.new(Merchant.most_revenue(num))
	end
	
end