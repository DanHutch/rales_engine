require 'rails_helper'

describe "Merchant Items API" do 
	it "returns all items for a merchant" do
		merch = create(:merchant, id: 1)
		item_1, item_2, item_3 = create_list(:item, 3, merchant_id: merch.id)

		get "/api/v1/merchants/#{merch.id}/items"

		expect(response).to be_successful

		items = JSON.parse(response.body)

		expect(items["data"].count).to eq(3)
		expect(items["data"][0]["attributes"]["merchant_id"]).to eq(merch.id)
	end

end