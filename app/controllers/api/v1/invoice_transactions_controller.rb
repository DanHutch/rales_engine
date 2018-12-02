class Api::V1::InvoiceTransactionsController < ApplicationController

  def index
    render json: TransactionSerializer.new(Invoice.find(params[:id]).transactions)
  end
		
end