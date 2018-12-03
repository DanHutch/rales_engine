require 'rails_helper'

describe "Invoice Invoice Items API" do 
	it "returns all invoice items for an invoice" do
		inv = create(:invoice, id: 1)
		ii_1, ii_2, ii_3 = create_list(:invoice_item, 3, invoice_id: inv.id)

		get "/api/v1/invoices/#{inv.id}/invoice_items"

		expect(response).to be_successful

		invoice_items = JSON.parse(response.body)

		expect(invoice_items["data"].count).to eq(3)
		expect(invoice_items["data"][0]["attributes"]["invoice_id"]).to eq(inv.id)
	end

end