class Api::V1::InvoiceInvoiceItemsController < ApplicationController

  def index
    render json: InvoiceItemSerializer.new(Invoice.find(params[:id]).invoice_items)
  end
		
end