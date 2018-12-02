class Api::V1::ItemsByInvoiceController < ApplicationController

	def index
    render json: ItemSerializer.new(Invoice.item_list(params[:id]))
  end
		
end
