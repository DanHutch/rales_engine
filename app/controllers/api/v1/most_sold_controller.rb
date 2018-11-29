class Api::V1::MostSoldController < ApplicationController

	def index
    render json: ItemSerializer.new(Item.most_sold(params["quantity"]))
  end
	
end