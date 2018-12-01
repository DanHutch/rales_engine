require 'rails_helper'

describe "Item Best Day API" do 

	it "can get the best day for an item" do
		item_1 = create(:item)
		allow(Item).to receive(:item_best_day).with("#{item_1.id}").and_return("2012-03-23 10:55:29")

		get "/api/v1/items/#{item_1.id}/best_day"

		best_day = JSON.parse(response.body)

		expect(response).to be_successful
		# binding.pry
		expect(best_day["data"]["attributes"]["best_day"]).to eq("2012-03-23 10:55:29")
	end
end