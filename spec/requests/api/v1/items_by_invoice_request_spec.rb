require 'rails_helper'

describe "Items by Invoice API" do 
	it "returns all items for an invoice" do
		inv = create(:invoice, id: 1)
		item_1 = create(:item, id:1)
		item_2 = create(:item, id:2)
		item_3 = create(:item, id:3)
		ii_1 = create(:invoice_item, invoice_id: inv.id, item_id: item_1.id) 
		ii_2 = create(:invoice_item, invoice_id: inv.id, item_id: item_2.id) 
		ii_3 = create(:invoice_item, invoice_id: inv.id, item_id: item_3.id) 
		

		get "/api/v1/invoices/#{inv.id}/items"

		expect(response).to be_successful

		items = JSON.parse(response.body)

		expect(items["data"].count).to eq(3)
		expect(items["data"][0]["attributes"]["id"]).to eq(item_1.id)
	end

end