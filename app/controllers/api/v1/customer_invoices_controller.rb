class Api::V1::CustomerInvoicesController < ApplicationController

	def index
    render json: InvoiceSerializer.new(Customer.find(params[:id]).invoices)
  end
		
end
