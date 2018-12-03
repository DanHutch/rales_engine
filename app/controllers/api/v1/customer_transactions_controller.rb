class Api::V1::CustomerTransactionsController < ApplicationController

	def index
    render json: TransactionSerializer.new(Customer.transaction_list(params[:id]))
  end
		
end
