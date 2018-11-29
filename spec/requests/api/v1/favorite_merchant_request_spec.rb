require 'rails_helper'

describe "Favorite Merchant API" do 

	it "can get a customer's favorite merchant" do
		custy = create(:customer)
		id = custy.id

		get "/api/v1/customers/#{id}/favorite_merchant"

		fav_merch = JSON.parse(response.body)

		expect(response).to be_successful

	end
end