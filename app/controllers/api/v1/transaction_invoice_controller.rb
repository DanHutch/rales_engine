class Api::V1::TransactionInvoiceController < ApplicationController

	def show
    render json: InvoiceSerializer.new(Transaction.find(params[:id]).invoice)
  end
		
end
