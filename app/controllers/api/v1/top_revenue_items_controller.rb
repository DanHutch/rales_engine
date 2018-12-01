class Api::V1::TopRevenueItemsController < ApplicationController

	def index
		num = params["quantity"]
    render json: ItemSerializer.new(Item.most_revenue(num))
  end
	
end