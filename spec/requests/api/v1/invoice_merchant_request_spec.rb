require 'rails_helper'

describe "Merchant by Invoice API" do 
	it "returns merchant for an invoice" do
		merch = create(:merchant, id: 1)
		inv = create(:invoice, id: 1, merchant_id: merch.id)

		get "/api/v1/invoices/#{inv.id}/merchant"

		expect(response).to be_successful

		merchant = JSON.parse(response.body)
		
		expect(merchant["data"]["attributes"]["id"]).to eq(merch.id)
	end

end