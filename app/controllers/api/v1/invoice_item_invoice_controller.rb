class Api::V1::InvoiceItemInvoiceController < ApplicationController

	def show
    render json: InvoiceSerializer.new(InvoiceItem.find(params[:id]).invoice)
  end
		
end
