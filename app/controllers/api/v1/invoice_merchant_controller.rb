class Api::V1::InvoiceMerchantController < ApplicationController

	def show
    render json: MerchantSerializer.new(Invoice.find(params[:id]).merchant)
  end
		
end
