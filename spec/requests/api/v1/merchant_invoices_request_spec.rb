require 'rails_helper'

describe "Merchant Invoices API" do 
	it "returns all invoices for a merchant" do
		merch = create(:merchant, id: 1)
		invoice_1, invoice_2, invoice_3 = create_list(:invoice, 3, merchant_id: merch.id)

		get "/api/v1/merchants/#{merch.id}/invoices"

		expect(response).to be_successful

		invoices = JSON.parse(response.body)

		expect(invoices["data"].count).to eq(3)
		expect(invoices["data"][0]["attributes"]["merchant_id"]).to eq(merch.id)
	end

end