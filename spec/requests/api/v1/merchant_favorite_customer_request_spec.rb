require 'rails_helper'

describe "Merchant Favorite Customer API" do 

	it "can return the favorite customer for a merchant based on successful transactions" do
		merch_1 = build(:merchant, id: 1)
		custy = create(:customer)

		allow(Merchant).to receive(:fav_customer).with("1").and_return(custy)

get '/api/v1/merchants/1/favorite_customer'

		fav_cust = JSON.parse(response.body)

		expect(response).to be_successful
		expect(fav_cust["data"]["attributes"]["id"]).to eq(custy.id)
		expect(fav_cust["data"]["id"]).to eq("#{custy.id}")

	end
end