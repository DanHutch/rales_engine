require 'rails_helper'

describe "Invoice by Transaction API" do 
	it "returns the invoice for a transaction" do
		inv = create(:invoice, id: 1)
		tran = create(:transaction, id: 1, invoice_id: inv.id)
	

		get "/api/v1/transactions/#{tran.id}/invoice"

		expect(response).to be_successful

		result = JSON.parse(response.body)
		expect(result["data"]["attributes"]["id"]).to eq(inv.id)

	end

end