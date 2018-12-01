class Api::V1::MerchantsMostItemsSoldController < ApplicationController

	def index
		num = params["quantity"]
		render json: MerchantSerializer.new(Merchant.top_sellers(num))
	end
	
end