require 'rails_helper'

describe "Most Sold Items API" do 

	xit "can get the most sold items" do
		custy = create(:customer)
		item_1, item_2, item_3, item_4 = create_list(:item, 4)
		allow(Customer).to receive(:most_sold).with("2").and_return([item_1, item_4])

		get "/api/v1/items/most_items?quantity=2"

		most_sold = JSON.parse(response.body)

		expect(response).to be_successful
		expect(most_sold["data"].count).to eq(2)

	end
end