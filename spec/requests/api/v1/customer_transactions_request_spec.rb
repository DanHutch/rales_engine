require 'rails_helper'

describe "Transactions by Customer API" do 
	it "returns all transactions for a customer" do
		custy = create(:customer, id: 1 )
		inv = create(:invoice, id: 100, customer_id: custy.id)
		inv_2 = create(:invoice, id: 101, customer_id: custy.id)
		inv_3 = create(:invoice, id: 102, customer_id: custy.id)
		tran_1 = create(:transaction, invoice_id: inv.id, id: 200, result: "failure")
		tran_2 = create(:transaction, invoice_id: inv_2.id, id: 201, result: "failure")
		tran_3 = create(:transaction, invoice_id: inv_3.id, id: 202, result: "success")

		get "/api/v1/customers/#{custy.id}/transactions"

		expect(response).to be_successful

		result = JSON.parse(response.body)

		expect(result["data"].count).to eq(3)
		expect(result["data"][0]["attributes"]["id"]).to eq(tran_1.id)
		expect(result["data"][1]["attributes"]["id"]).to eq(tran_2.id)
		expect(result["data"][2]["attributes"]["id"]).to eq(tran_3.id)

	end

end