class Api::V1::InvoiceCustomerController < ApplicationController

	def show
    render json: CustomerSerializer.new(Invoice.find(params[:id]).customer)
  end
		
end
