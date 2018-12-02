require 'rails_helper'

describe "Customers by Invoice API" do 
	it "returns all customers for an invoice" do
		custy = create(:customer, id: 1)
		inv = create(:invoice, id: 1, customer_id: custy.id)

		get "/api/v1/invoices/#{inv.id}/customer"

		expect(response).to be_successful

		customer = JSON.parse(response.body)
		
		expect(customer["data"]["attributes"]["id"]).to eq(custy.id)
	end

end