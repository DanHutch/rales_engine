require 'rails_helper'

describe "Merchants by most revenue API" do 

	it "can return the top merchants by revenue" do
		custy = create(:customer)
		merch = create(:merchant)
		id = merch.id

		get '/api/v1/merchants/most_revenue?quantity=2'

		revenue = JSON.parse(response.body)

		expect(response).to be_successful

	end
end