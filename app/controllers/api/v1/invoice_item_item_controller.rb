class Api::V1::InvoiceItemItemController < ApplicationController

	def show
    render json: ItemSerializer.new(InvoiceItem.find(params[:id]).item)
  end
		
end
