require 'rails_helper'

describe "Item Merchant by Item API" do 
	it "returns the merchant for an item" do
		merch = create(:merchant, id:1)
		item = create(:item, id: 1, merchant_id: merch.id)

		get "/api/v1/items/#{item.id}/merchant"

		expect(response).to be_successful

		result = JSON.parse(response.body)
		expect(result["data"]["attributes"]["id"]).to eq(merch.id)

	end

end