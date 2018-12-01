require 'rails_helper'

RSpec.describe Item, type: :model do
	it {should belong_to(:merchant)}
	it {should have_many(:invoice_items)}
	it {should have_many(:invoices).through(:invoice_items)}

	before(:each) do
		@custy = create(:customer)
		@merch = create(:merchant)
		@item_1, @item_2, @item_3, @item_4,@item_5 = create_list(:item, 5, merchant_id: @merch.id)
		@inv_1, @inv_2, @inv_3, @inv_4, @inv_5 = create_list(:invoice, 5, created_at: "2012-12-21")
		@tran_1 = create(:transaction, invoice_id: @inv_1.id, result: "success")
		@tran_2 = create(:transaction, invoice_id: @inv_2.id, result: "success")
		@tran_3 = create(:transaction, invoice_id: @inv_3.id, result: "success")
		@tran_4 = create(:transaction, invoice_id: @inv_4.id, result: "success")
		@tran_5 = create(:transaction, invoice_id: @inv_5.id, result: "failure")
		@inv_it_1 = create(:invoice_item, item_id: @item_1.id, quantity: 5, invoice_id: @inv_1.id)
		@inv_it_2 = create(:invoice_item, item_id: @item_2.id, quantity: 10, invoice_id: @inv_2.id)
		@inv_it_3 = create(:invoice_item, item_id: @item_3.id, quantity: 15, invoice_id: @inv_3.id)
		@inv_it_4 = create(:invoice_item, item_id: @item_4.id, quantity: 20, invoice_id: @inv_4.id)
		@inv_it_5 = create(:invoice_item, item_id: @item_5.id, quantity: 25, invoice_id: @inv_5.id)
	end

	it "can return the most popular items by number sold" do
		expect(Item.most_sold(1)).to eq([@item_4])
	end

	it "can return the best items by revenue" do
		expect(Item.most_revenue(2)).to eq([@item_4, @item_3])
	end

	it "can return the best date for an item" do
		id = @item_4.id
		new_inv_1 = create(:invoice, created_at: "2012-12-23")
		new_inv_2 = create(:invoice, created_at: "2012-12-23")
		new_inv_3 = create(:invoice, created_at: "2012-12-22")
		new_inv_4 = create(:invoice, created_at: "2012-12-22")
		new_tran_1 = create(:transaction, invoice_id: new_inv_1.id, result: "success")
		new_tran_2 = create(:transaction, invoice_id: new_inv_2.id, result: "success")
		new_tran_3 = create(:transaction, invoice_id: new_inv_3.id, result: "success")
		new_tran_4 = create(:transaction, invoice_id: new_inv_4.id, result: "failure")
		new_ii_1 = create(:invoice_item, item_id: id, quantity: 10, invoice_id: new_inv_1.id)
		new_ii_2 = create(:invoice_item, item_id: id, quantity: 10, invoice_id: new_inv_2.id)
		new_ii_1 = create(:invoice_item, item_id: id, quantity: 10, invoice_id: new_inv_3.id)
		new_ii_1 = create(:invoice_item, item_id: id, quantity: 15, invoice_id: new_inv_4.id)

		
		expect(Item.item_best_day(id)).to eq("2012-12-23")
		
	end

end
