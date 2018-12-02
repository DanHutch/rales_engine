require 'rails_helper'

RSpec.describe Merchant, type: :model do
	it{should have_many(:items)}
	it{should have_many(:invoices)}

	before(:each) do
		@custy = create(:customer)
		@custy_2 = create(:customer)
		@merch_1 = create(:merchant)
		@merch_2 = create(:merchant)
		@merch_3 = create(:merchant)
		@item_1 = create(:item, merchant_id: @merch_1.id)
		@item_2 = create(:item, merchant_id: @merch_2.id)
		@item_3 = create(:item, merchant_id: @merch_3.id)
		@invoice_1 = create(:invoice, merchant_id: @merch_1.id, customer_id: @custy.id, created_at: '2018-04-20')
		@invoice_2 = create(:invoice, merchant_id: @merch_2.id, customer_id: @custy_2.id, created_at: '2018-04-20')
		@invoice_3 = create(:invoice, merchant_id: @merch_3.id, customer_id: @custy_2.id, created_at: '2018-04-20')
		@invoice_4 = create(:invoice, merchant_id: @merch_1.id, customer_id: @custy_2.id, created_at: '2018-04-21')
		@ii_1 = create(:invoice_item, item_id: @item_1.id, invoice_id: @invoice_1.id, quantity: 10, unit_price: 1000000 )
		@ii_2 = create(:invoice_item, item_id: @item_2.id, invoice_id: @invoice_2.id, quantity: 20, unit_price: 2000000 )
		@ii_3 = create(:invoice_item, item_id: @item_3.id, invoice_id: @invoice_3.id, quantity: 10, unit_price: 3000000 )
		@ii_4 = create(:invoice_item, item_id: @item_1.id, invoice_id: @invoice_4.id, quantity: 10, unit_price: 4000000 )
		@tran_1 = create(:transaction, invoice_id: @invoice_1.id, result: "success")
		@tran_2 = create(:transaction, invoice_id: @invoice_2.id, result: "success")
		@tran_3 = create(:transaction, invoice_id: @invoice_3.id, result: "success")
		@tran_4 = create(:transaction, invoice_id: @invoice_4.id, result: "success")
	end

	it "can return the revenue by date across all merchants" do
		expect(Merchant.revenue_by_date('2018-04-20')).to eq(80000000)
	end

	it "can return top merchants by revenue" do
		expect(Merchant.most_revenue(2)).to eq([@merch_1, @merch_2])
	end

	it "can return top merchants by items sold" do
		expect(Merchant.top_sellers(2)).to eq([@merch_1, @merch_2])
	end

	it "can return total revenue for a merchant" do
		expect(Merchant.revenue(@merch_3.id)).to eq(30000000)
		expect(Merchant.revenue(@merch_1.id)).to eq(50000000)
	end

	it "can return total revenue for a merchant on a specific date" do
		expect(Merchant.single_revenue_by_date(@merch_1.id, "2018-04-20")).to eq(10000000)
		expect(Merchant.single_revenue_by_date(@merch_1.id, "2018-04-21")).to eq(40000000)
	end

	it "can return a merchant's favorite customer" do
		another_inv = create(:invoice, merchant_id: @merch_1.id, customer_id: @custy_2.id, created_at: '2018-04-20')
		another_tran = create(:transaction, invoice_id: another_inv.id, result: "success")
		expect(Merchant.fav_customer(@merch_1.id)).to eq(@custy_2)
	end

	# it "can find all customers with pending invoices" do

	# end
	
end
