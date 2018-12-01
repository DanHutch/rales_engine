require 'rails_helper'

describe "Favorite Merchant API" do 

	it "can get a customer's favorite merchant" do
		customer_id = "1"
		merch = build(:merchant, id: 100)
		allow(Customer).to receive(:fav_merchant).with(customer_id).and_return(merch)

		get "/api/v1/customers/#{customer_id}/favorite_merchant"

		fav_merch = JSON.parse(response.body)
		expect(response).to be_successful

		expect(fav_merch["data"]["id"].to_i).to eq(merch.id)
	end
end