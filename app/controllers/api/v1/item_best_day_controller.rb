class Api::V1::ItemBestDayController < ApplicationController

	def show
		date = Item.item_best_day(params[:id])
		date_object = InvoiceDate.new(date)
		render json: InvoiceDateSerializer.new(date_object)
  end
  
end