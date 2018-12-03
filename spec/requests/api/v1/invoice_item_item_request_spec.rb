require 'rails_helper'

describe "Item by Invoice Items API" do 
	it "returns the item for an invoice item" do
		item = create(:item, id: 1)
		ii = create(:invoice_item, id: 1, item_id: item.id)

		get "/api/v1/invoice_items/#{ii.id}/item"

		expect(response).to be_successful

		result = JSON.parse(response.body)
		expect(result["data"]["attributes"]["id"]).to eq(item.id)
	end

end