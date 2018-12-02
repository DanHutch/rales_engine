class Api::V1::MerchantInvoicesController < ApplicationController

  def index
    render json: InvoiceSerializer.new(Merchant.find(params[:id]).invoices)
  end
		
end