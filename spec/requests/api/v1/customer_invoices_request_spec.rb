require 'rails_helper'

describe "Invoices by Customer API" do 
	it "returns all invoices for a customer" do
		custy = create(:customer, id: 1 )
		inv = create(:invoice, id: 100, customer_id: custy.id)
		inv_2 = create(:invoice, id: 101, customer_id: custy.id)
		inv_3 = create(:invoice, id: 102, customer_id: custy.id)

		get "/api/v1/customers/#{custy.id}/invoices"

		expect(response).to be_successful

		result = JSON.parse(response.body)

		expect(result["data"].count).to eq(3)
		expect(result["data"][0]["attributes"]["id"]).to eq(inv.id)
		expect(result["data"][1]["attributes"]["id"]).to eq(inv_2.id)
		expect(result["data"][2]["attributes"]["id"]).to eq(inv_3.id)

	end

end