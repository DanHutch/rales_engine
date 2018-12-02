require 'rails_helper'

describe "Merchant Revenue API" do 

	it "can return the revenue for a merchant" do
		merch_1 = build(:merchant, id: 1)

		allow(Merchant).to receive(:revenue).with("1").and_return(10000000)

		get '/api/v1/merchants/1/revenue'

		merchant = JSON.parse(response.body)

		expect(response).to be_successful
		expect(merchant["data"]["attributes"]["revenue"]).to eq("100000.00")
	end
end