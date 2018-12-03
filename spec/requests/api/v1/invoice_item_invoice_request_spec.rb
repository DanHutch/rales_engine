require 'rails_helper'

describe "Invoice by Invoice Items API" do 
	it "returns the invoice for an invoice item" do
		inv = create(:invoice, id: 1)
		ii = create(:invoice_item, id: 1, invoice_id: inv.id)

		get "/api/v1/invoice_items/#{ii.id}/invoice"

		expect(response).to be_successful

		invoice = JSON.parse(response.body)
		
		expect(invoice["data"]["attributes"]["id"]).to eq(inv.id)
	end

end