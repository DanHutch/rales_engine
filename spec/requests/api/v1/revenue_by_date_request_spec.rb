require 'rails_helper'

describe "Revenue By Date API" do 

	it "can get the revenue for a date" do
		custy = create(:customer)
		id = custy.id

		get '/api/v1/merchants/revenue?date=2012-03-10'

		revenue = JSON.parse(response.body)

		expect(response).to be_successful

	end
end