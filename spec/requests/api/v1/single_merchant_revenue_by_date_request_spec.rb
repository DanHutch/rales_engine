require 'rails_helper'

describe "Single Merchant Revenue by Date API" do 

	it "can return the revenue for a merchant on a specific date" do
		merch_1 = build(:merchant, id: 1)

		allow(Merchant).to receive(:single_revenue_by_date).with("1", "2012-12-21").and_return(10000000)

		get '/api/v1/merchants/1/revenue?date=2012-12-21'

		merchant = JSON.parse(response.body)

		expect(response).to be_successful
		expect(merchant["data"]["attributes"]["revenue"]).to eq("100000.00")
	end
end