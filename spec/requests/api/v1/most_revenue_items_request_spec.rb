require 'rails_helper'

describe "Top Revenue Items API" do 

	it "can get the top revenue items" do
		item_1, item_2, item_3, item_4 = create_list(:item, 4)
		allow(Item).to receive(:most_revenue).with("2").and_return([item_1, item_4])

		get "/api/v1/items/most_revenue?quantity=2"

		top_items = JSON.parse(response.body)

		expect(response).to be_successful
		expect(top_items["data"].count).to eq(2)
		# binding.pry
		expect(top_items["data"][0]["id"]).to eq(item_1.id.to_s)

	end
end