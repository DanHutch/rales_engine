require 'rails_helper'

describe "Invoice Transactions API" do 
	it "returns all transactions for an invoice" do
		inv = create(:invoice, id: 1)
		tran_1, tran_2 = create_list(:transaction, 2, invoice_id: inv.id, result: "failure")
		tran_3 = create(:transaction, invoice_id: inv.id, result: "success")

		get "/api/v1/invoices/#{inv.id}/transactions"

		expect(response).to be_successful

		transactions = JSON.parse(response.body)

		expect(transactions["data"].count).to eq(3)
		expect(transactions["data"][0]["attributes"]["invoice_id"]).to eq(inv.id)
	end

end