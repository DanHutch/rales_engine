require 'rails_helper'

describe "Invoices API" do 
	it "sends a list of invoices" do
		create_list(:invoice, 3)

		get '/api/v1/invoices'

		expect(response).to be_successful

		invoices = JSON.parse(response.body)

		expect(invoices["data"].count).to eq(3)

	end

	it "can get a single invoice by id" do
		id = create(:invoice).id

		get "/api/v1/invoices/#{id}"

		invoice = JSON.parse(response.body)

		expect(response).to be_successful
		expect(invoice["data"]["id"]).to eq(id.to_s)

	end
end