require 'rails_helper'

describe "Invoice Item by Item API" do 
	it "returns the invoice items for an item" do
		item = create(:item, id: 1)
		ii_1 = create(:invoice_item, id: 1, item_id: item.id)
		ii_2 = create(:invoice_item, id: 2, item_id: item.id)
		ii_3 = create(:invoice_item, id: 3, item_id: item.id)

		get "/api/v1/items/#{item.id}/invoice_items"

		expect(response).to be_successful

		result = JSON.parse(response.body)
		expect(result["data"][0]["attributes"]["id"]).to eq(ii_1.id)
		expect(result["data"][1]["attributes"]["id"]).to eq(ii_2.id)
		expect(result["data"][2]["attributes"]["id"]).to eq(ii_3.id)
	end

end