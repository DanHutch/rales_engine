require 'rails_helper'

describe "Favorite Merchant API" do 

	xit "can get a customer's favorite merchant" do
			custy = create(:customer)
		other_cust = create(:customer)
		id = custy.id
		expect(id).to eq(1)
		merch_1, merch_2, merch_3 = create_list(:merchant, 3)
		inv_1 = create(:invoice, customer_id: 1, merchant_id: 1, status: "shipped")
		inv_2 = create(:invoice, customer_id: 1, merchant_id: 1, status: "shipped")
		inv_3 = create(:invoice, customer_id: 1, merchant_id: 1, status: "shipped")
		inv_4 = create(:invoice, customer_id: 1, merchant_id: 2, status: "shipped")
		inv_5 = create(:invoice, customer_id: 1, merchant_id: 2, status: "shipped")
		inv_6 = create(:invoice, customer_id: 1, merchant_id: 3, status: "shipped")
		inv_7 = create(:invoice, customer_id: 1, merchant_id: 3)
		inv_8 = create(:invoice, customer_id: 1, merchant_id: 3)
		inv_9 = create(:invoice, customer_id: 2, merchant_id: 3)
		tran_1 = create(:transaction, invoice_id: inv_1.id, result: "success")
		tran_2 = create(:transaction, invoice_id: inv_2.id, result: "success")
		tran_3 = create(:transaction, invoice_id: inv_3.id, result: "success")
		tran_4 = create(:transaction, invoice_id: inv_4.id, result: "success")
		tran_5 = create(:transaction, invoice_id: inv_5.id, result: "success")
		tran_6 = create(:transaction, invoice_id: inv_6.id, result: "success")
		tran_7 = create(:transaction, invoice_id: inv_7.id, result: "success")
		tran_8 = create(:transaction, invoice_id: inv_8.id, result: "failure")
		tran_8 = create(:transaction, invoice_id: inv_9.id, result: "success")

		binding.pry
		get "/api/v1/customers/#{id}/favorite_merchant"

		fav_merch = JSON.parse(response.body)

		expect(response).to be_successful
		expect(fav_merch["id"]).to eq(id)

	end
end