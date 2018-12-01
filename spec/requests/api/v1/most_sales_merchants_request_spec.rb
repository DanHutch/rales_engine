require 'rails_helper'

describe "Merchants by most revenue API" do 

	it "can return the top merchants by revenue" do
		merch_1 = build(:merchant, id: 1)
		merch_2 = build(:merchant, id: 2)

		allow(Merchant).to receive(:top_sellers).with("2").and_return([merch_1, merch_2])

		get '/api/v1/merchants/most_items?quantity=2'

		merchants = JSON.parse(response.body)
		expect(response).to be_successful
		expect(merchants["data"][0]["id"].to_i).to eq(merch_1.id)
		expect(merchants["data"][1]["id"].to_i).to eq(merch_2.id)
	end
end