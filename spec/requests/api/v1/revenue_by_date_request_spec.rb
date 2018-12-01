require 'rails_helper'

describe "Revenue By Date API" do 

	it "can get the revenue for a date" do
		merch = build(:merchant, id: 1)

		allow(Merchant).to receive(:revenue_by_date).with("2012-03-10").and_return(101010)

		get '/api/v1/merchants/revenue?date=2012-03-10'

		revenue = JSON.parse(response.body)

		expect(response).to be_successful

		expect(revenue["data"]["attributes"]["total_revenue"]).to eq("1010.10")
	end
end